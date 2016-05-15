class MemoRepository < Sequel::Model(:memos)
  many_to_one :post, class: :PostRepository

  attr_accessor :up_or_down, :next_memo_id

  def attributes
    { post_id: post_id, sort_order: sort_order, body: body }
  end
end
