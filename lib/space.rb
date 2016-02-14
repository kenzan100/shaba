module Shaba
  class Space
    attr_accessor :posts
    attr_reader :user, :type
    def initialize(args)
      self.user = args[:user]
      self.type = args[:type]
    end

    def add(post)
      self.posts ||= []
      self.posts << post
    end

    private
    attr_writer :user, :type
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
