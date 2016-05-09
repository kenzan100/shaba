class MemoRepository
  include Hanami::Repository

  class << self
    def find_or_create(memo)
      uniq = query do where(body: memo.body) end
      return uniq.first if uniq.exist?
      create memo
    end
  end
end
