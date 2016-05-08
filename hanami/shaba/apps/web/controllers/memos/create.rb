module Web::Controllers::Memos
  class Create
    include Web::Action

    expose :memo

    def call(params)
      @memo = MemoRepository.create(Memo.new(params[:memo]))
      redirect_to '/memos'
    end
  end
end
