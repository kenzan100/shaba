module Web::Views::Memos
  class New
    include Web::View

    def path
      routes.memos_path
    end

    def method
      :post
    end

    def values
      { }
    end
  end
end
