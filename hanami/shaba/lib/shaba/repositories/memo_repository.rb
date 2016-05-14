class MemoRepository < Sequel::Model(:memos)
  many_to_one :post, class: :PostRepository
end
