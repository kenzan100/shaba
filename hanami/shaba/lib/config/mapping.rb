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

collection :posts do
  entity     Post
  repository PostRepository

  attribute :title, String
end

collection :spaces do
  entity     Space
  repository SpaceRepository

  attribute :user, String
  attribute :type, String
end
