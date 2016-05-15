module Post
  class Update
    def initialize(post_id)
      @post = PostRepository.find(id: post_id)
    end

    def run(params)
      posts_space = Space::Find.new(:posts).run
      @post.space_id = posts_space.id
      @post.save
    end
  end
end
