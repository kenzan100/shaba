module Web::Controllers::Memos
  class Create
    include Web::Action

    def call(params)
      space = Space::FindDraft.new.run
      post  = Post::AddTo.new(space).run
      Memo::AddTo.new(post).run(params[:memo])
      redirect_to '/memos'
    end
  end
end
