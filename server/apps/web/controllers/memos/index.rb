module Web::Controllers::Memos
  class Index
    include Web::Action

    expose :posts

    def call(params)
      draft_space = Space::Find.new(:draft).run
      @posts = draft_space.posts_with_memos
    end
  end
end
