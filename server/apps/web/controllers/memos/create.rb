module Web::Controllers::Memos
  class Create
    include Web::Action

    def call(params)
      space = Space::Find.new(:draft).run
      post  = Post::SmartAdd.new(space).run(params[:memo])
      Memo::AddTo.new(post).run(params[:memo])
      redirect_to "/memos?p=#{post.id}"
    end
  end
end
