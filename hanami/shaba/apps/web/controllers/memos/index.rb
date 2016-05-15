module Web::Controllers::Memos
  class Index
    include Web::Action

    expose :memos

    def call(params)
      draft_space = Space::FindDraft.new.run
      @memos = draft_space.posts.flat_map { |p| Post::OrderedMemo.new(p).run }
    end
  end
end
