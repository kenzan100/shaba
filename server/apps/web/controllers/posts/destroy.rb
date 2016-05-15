module Web::Controllers::Posts
  class Destroy
    include Web::Action

    def call(params)
      post = PostRepository.find(id: params[:id])
      post.destroy
      redirect_to routes.space_path(:posts)
    end
  end
end
