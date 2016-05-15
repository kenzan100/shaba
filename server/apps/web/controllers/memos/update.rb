module Web::Controllers::Memos
  class Update
    include Web::Action

    def call(params)
      Memo::UpdateBody.new(params[:id]).run(params[:memo])
      redirect_to routes.memos_path
    end
  end
end
