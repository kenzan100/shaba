module Web::Views::Posts
  class Edit
    include Web::View

    def path
      routes.post_path(id: post.id)
    end

    def method
      :patch
    end

    def values
      { post: post }
    end
  end
end
