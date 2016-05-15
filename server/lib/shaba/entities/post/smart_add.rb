module Post
  class SmartAdd
    def initialize(space)
      @space = space
    end

    def run(params)
      if (params["up_or_down"] && !params["up_or_down"].empty?) \
        && (params["next_memo_id"] && !params["next_memo_id"].empty?)
        return MemoRepository.find(id: params["next_memo_id"]).post
      end
      AddTo.new(@space).run
    end
  end
end
