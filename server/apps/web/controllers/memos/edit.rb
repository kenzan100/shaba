module Web::Controllers::Memos
  class Edit
    include Web::Action

    expose :memo

    def call(params)
      @memo = MemoRepository.find(id: params[:id])
    end
  end
end
