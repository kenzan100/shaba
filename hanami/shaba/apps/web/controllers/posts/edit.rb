module Web::Controllers::Posts
  class Edit
    include Web::Action

    expose :post
    expose :memos

    def call(params)
      @post  = PostRepository.find(id: params[:id])
      @memos = @post.ordered_memos
    end
  end
end
