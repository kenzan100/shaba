module Post
  class AddTo
    def initialize(space, title: "New Post #{Date.today}")
      @post = PostRepository.new(title: title, space_id: space.id)
    end

    def run
      @post.save
    end
  end
end
