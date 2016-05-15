module Memo
  class AddTo
    def initialize(post)
      @memo = MemoRepository.new(post_id: post.id)
    end

    def run(params)
      Splitter.new(@memo, params).save_all
    end
  end
end
