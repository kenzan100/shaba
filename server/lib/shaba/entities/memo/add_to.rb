module Memo
  class AddTo
    def initialize(post)
      @memo = MemoRepository.new(post_id: post.id)
    end

    def run(params)
      default_body = { "body" => "Sample Body" }
      params.merge!(default_body) if params["body"].empty?
      Splitter.new(@memo, params).save_all
    end
  end
end
