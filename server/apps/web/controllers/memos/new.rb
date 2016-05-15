module Web::Controllers::Memos
  class New
    include Web::Action

    expose :memo

    def call(params)
      @memo = MemoRepository.new(up_or_down: params[:up_or_down],
                                 next_memo_id: params[:next_memo_id])
    end
  end
end
