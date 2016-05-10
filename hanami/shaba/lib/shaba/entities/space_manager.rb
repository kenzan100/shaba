class SpaceManager
  class << self
    def add_memo_to_draft_space(memo)
      draft_space = draft_space_for(ENV['USER'])
      post = draft_space.post
      post.add(memo)
      draft_space
    end

    def construct_for(user_key)
      [Space.new(user: user_key, type: :draft),
       Space.new(user: user_key, type: :private)]
    end

    def draft_space_for(user_key)
      spaces = construct_for(user_key)
      spaces.detect { |s| s.draft_space? }
    end
  end
end
