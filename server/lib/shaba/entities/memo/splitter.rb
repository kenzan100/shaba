module Memo
  class Splitter
    def initialize(memo, params)
      @memo   = memo
      @params = params
    end

    def save_all
      memos_params
      # TODO Passing memos_params will modify the object array. Research why.
      # memos_params.each do |memo, params|
      #   Organizer.new(memo).save_with(params)
      # end
    end

    private

    def memos_params
      if @params["body"].nil?
        Organizer.new(@memo).save_with(@params)
        return
      end

      body = @params["body"].strip
      bodies = body.split(/[\r|\n]+/)
      @memos_size = bodies.size
      if @memos_size < 2
        Organizer.new(@memo).save_with(@params.merge("body" => body))
        return
      end
      @memo.tap { |m| m.body = "tmp" }.save
      bodies.each.with_index do |split_body, i|
        param = {}
        param["body"] = split_body.strip
        param["sort_order"] = @memo.sort_order + i
        add_reorder_params!(param) if i == 0
        Organizer.new(MemoRepository.new(@memo.attributes)).save_with(param)
      end
      @memo.destroy
    end

    def add_reorder_params!(params)
      params["up_or_down"] = :down
      params["moved_by"]   = 0
      params["pushed_by"]  = @memos_size
      params["next_memo_id"] = @memo.id # find_closest_memo_by_sort_order(params["sort_order"]).id
    end

    def find_closest_memo_by_sort_order(direction: :down)
      config = { down: { comp_sign: ">=" } }[direction]
      MemoRepository
        .where(post_id: @memo.post_id)
        .where("memos.sort_order #{config[:comp_sign]} ?", @memo.sort_order).order(:sort_order)
        .last
    end
  end
end
