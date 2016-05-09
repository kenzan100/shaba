module Web::Controllers::Memos
  class Index
    include Web::Action

    expose :memos

    def call(params)
      @memos = MemoRepository.all
    end
  end
end
