class PostRepository < Sequel::Model(:posts)
  one_to_many :memos, class: :MemoRepository, key: :post_id
end
