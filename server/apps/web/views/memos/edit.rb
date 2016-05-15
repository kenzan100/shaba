module Web::Views::Memos
  class Edit
    include Web::View
    template "memos/new"

    def path
      routes.memo_path(id: memo.id)
    end

    def method
      :patch
    end

    def values
      { memo: memo }
    end
  end
end
