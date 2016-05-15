module Memo
  class UpdateBody
    def initialize(memo_id)
      @memo = MemoRepository.find(id: memo_id)
    end

    def run(params)
      Splitter.new(@memo, params).save_all
    end
  end
end
