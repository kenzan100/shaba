module Shaba
  class Space
    attr_accessor :posts, :user, :type
    def initialize(args)
      self.user  = args[:user]
      self.type  = args[:type]
      self.posts = []
    end

    def add(post)
      self.posts ||= []
      self.posts << post
      post
    end

    def attributes
      {
        user: user,
        type: type,
        posts: posts
      }
    end
  end

  class SpaceManager
    class << self
      def construct_for(user)
        [Space.new(user: user, type: :draft),
         Space.new(user: user, type: :private)]
      end
    end
  end
end
