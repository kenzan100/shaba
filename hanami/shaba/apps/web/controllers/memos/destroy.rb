module Web::Controllers::Memos
  class Destroy
    include Web::Action

    def call(params)
      memo = MemoRepository.find(id: params[:id])
      memo.destroy
      redirect_to routes.memos_path
    end
  end
end
