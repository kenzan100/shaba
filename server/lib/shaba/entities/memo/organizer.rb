module Memo
  class Organizer
    def initialize(memo)
      @memo = memo
    end

    def save_with(params)
      organize_body(params)
      reorder(params)
      apply_sort_order(params)
      @memo.save
    end

    private

    def apply_sort_order(params)
      if params["sort_order"]
        @memo.sort_order = params["sort_order"].to_i
      end
    end

    def reorder(params)
      return if !params["up_or_down"]   || params["up_or_down"].empty?
      return if !params["next_memo_id"] || params["next_memo_id"] == ""

      pushed_by    = (params["pushed_by"] || 1).to_i
      self_move_by = (params["moved_by"]  || 1).to_i
      self_move_by = 0 if params["moved_by"] && params["moved_by"].zero?

      memo_moving_past = MemoRepository.find(id: params["next_memo_id"])
      conf = order_config[params["up_or_down"].to_sym]
      moving_memos = MemoRepository.where(post_id: memo_moving_past.post_id)
                                   .where("memos.sort_order #{conf[:comparision_sign]} ?", memo_moving_past.sort_order)
      moving_memos.update("sort_order = sort_order #{conf[:manipulation_sign]} #{pushed_by}")
      @memo.sort_order = memo_moving_past.sort_order.send(conf[:manipulation_sign], self_move_by)
      @memo.post_id    = memo_moving_past.post_id
    end

    def order_config
      {
        up:   { comparision_sign: "<",  manipulation_sign: "-" },
        down: { comparision_sign: ">",  manipulation_sign: "+" },
        gte:  { comparision_sign: ">=", manipulation_sign: "+" }
      }
    end

    def organize_body(params)
      return if params["body"].nil? || params["body"].empty?
      @memo.body = params["body"].strip
    end
  end
end
