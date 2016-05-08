# collection :users do
#   entity     User
#   repository UserRepository
#
#   attribute :id,   Integer
#   attribute :name, String
# end

collection :memos do
  entity     Memo
  repository MemoRepository

  attribute :id,         Integer
  attribute :body,       String
end
