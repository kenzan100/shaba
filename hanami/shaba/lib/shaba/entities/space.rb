class Space
  include Hanami::Entity

  attr_accessor :posts, :user, :type

  def initialize(args)
    self.user  = args[:user]
    self.type  = args[:type]
    self.posts = []
  end

  def add(post)
    self.posts ||= []
    self.posts << post
    post
  end

  def attributes
    {
      user: user,
      type: type,
      posts: posts
    }
  end

  def post
    return posts.first if posts.first
    add(Post.new)
  end

  def draft_space?
    type.to_sym == :draft
  end
end
