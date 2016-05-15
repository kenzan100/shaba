module Web::Controllers::Posts
  class Update
    include Web::Action

    def call(params)
      Post::Update.new(params[:id]).run(params[:post])
      redirect_to routes.space_path(:posts)
    end
  end
end
