module Post
  class OrderedMemo
    def initialize(post)
      @post = post
    end

    def run
      @post.memos_dataset.order(:sort_order).all
    end
  end
end
