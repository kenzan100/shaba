class SpaceRepository < Sequel::Model(:spaces)
  one_to_many :posts, class: :PostRepository, key: :space_id

  def posts_with_memos
    posts_dataset.distinct.select(:posts__id).join(:memos, post_id: :id).order(:posts__id).all
  end
end
