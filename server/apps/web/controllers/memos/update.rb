module Web::Controllers::Memos
  class Update
    include Web::Action

    def call(params)
      memo = MemoRepository.find(id: params[:id])
      Memo::UpdateBody.new(memo.id).run(params[:memo])
      redirect_to routes.memos_path(p: memo.post_id)
    end
  end
end
