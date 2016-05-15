module Memo
  class Organizer
    def initialize(memo)
      @memo = memo
    end

    def save_with(params)
      update_body(params)
      reorder(params)
      @memo.save
    end

    private

    def reorder(params)
      return unless params["up_or_down"] && params["next_memo_id"]

      memo_moving_past = MemoRepository.find(id: params["next_memo_id"])
      conf = order_config[params["up_or_down"].to_sym]
      moving_memos = MemoRepository.where(post_id: memo_moving_past.post_id)
                                   .where("memos.sort_order #{conf[:comparision_sign]} ?", memo_moving_past.sort_order)
      moving_memos.update("sort_order = sort_order #{conf[:manipulation_sign]} 1")
      @memo.sort_order = memo_moving_past.sort_order.send(conf[:manipulation_sign], 1)
      @memo.post_id    = memo_moving_past.post_id
    end

    def order_config
      { up:   { comparision_sign: "<", manipulation_sign: "-" },
        down: { comparision_sign: ">", manipulation_sign: "+" } }
    end

    def organize(text)
      return text unless text.kind_of?(String)
      text.chomp.strip
    end

    def update_body(params)
      return unless params["body"]
      organized_text = organize(params["body"])
      @memo.body = organized_text
    end
  end
end
