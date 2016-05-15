class PostRepository < Sequel::Model(:posts)
  one_to_many :memos, class: :MemoRepository, key: :post_id

  def ordered_memos
    memos_dataset.order(:sort_order).all
  end
end
