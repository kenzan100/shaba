class Space < Shaba::Space
  include Hanami::Entity

  def post
    return posts.first if posts.first
    add(Post.new)
  end

  def draft_space?
    type.to_sym == :draft
  end
end
