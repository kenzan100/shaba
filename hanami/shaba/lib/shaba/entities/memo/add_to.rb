module Memo
  class AddTo
    def initialize(post)
      @memo = MemoRepository.new(post_id: post.id)
    end

    def run(params)
      organized_text = organize(params["body"])
      @memo.body = organized_text
      @memo.save
    end

    private

    def organize(text)
      return text unless text.kind_of?(String)
      text.chomp.strip
    end
  end
end
