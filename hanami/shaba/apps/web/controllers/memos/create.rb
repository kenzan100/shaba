module Web::Controllers::Memos
  class Create
    include Web::Action

    def call(params)
      memo = Memo.new(params[:memo])
      draft_space = SpaceManager.add_memo_to_draft_space(memo)
      SpaceRepository.deep_create(draft_space)
      redirect_to '/memos'
    end
  end
end
