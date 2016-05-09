class PostRepository
  include Hanami::Repository

  class << self
    def find_or_create(post)
      post.title = "New Post"
      uniq = query do where(title: post.title) end
      return uniq.first if uniq.exist?
      create post
    end
  end
end
