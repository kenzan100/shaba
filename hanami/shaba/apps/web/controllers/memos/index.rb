module Web::Controllers::Memos
  class Index
    include Web::Action

    expose :posts

    def call(params)
      draft_space = Space::FindDraft.new.run
      @posts = draft_space.posts
    end
  end
end
