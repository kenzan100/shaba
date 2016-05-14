module Memo
  class Organizer
    def initialize(memo)
      @memo = memo
    end

    def save_with(params)
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
