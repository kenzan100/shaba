module Memo
  class AddTo
    def initialize(post)
      @memo = MemoRepository.new(post_id: post.id)
    end

    def run(params)
      Organizer.new(@memo).save_with(params)
    end
  end
end
