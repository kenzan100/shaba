module Memo
  class UpdateBody
    def initialize(memo_id)
      @memo = MemoRepository.find(id: memo_id)
    end

    def run(params)
      Organizer.new(@memo).save_with(params)
    end
  end
end
