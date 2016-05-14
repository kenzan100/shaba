class SpaceRepository < Sequel::Model(:spaces)
  one_to_many :posts, class: :PostRepository, key: :space_id
end
