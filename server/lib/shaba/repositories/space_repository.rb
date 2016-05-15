class SpaceRepository < Sequel::Model(:spaces)
  one_to_many :posts, class: :PostRepository, key: :space_id

  def posts_with_memos(post_id)
    posts_set = posts_dataset.distinct.select(:posts__id)
      .join(:memos, post_id: :id).order(:posts__id)
    posts_set = posts_set.where(posts__id: post_id) if post_id
    posts_set.all
  end

  def ordered_posts
    posts_dataset.order(:id).all
  end
end
