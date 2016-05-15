module Space
  class ConstructFor
    def initialize(user_key)
      @base_space = SpaceRepository.new(user_key: user_key)
    end

    def run
      types = %w(draft posts)
      types.map do |type|
        SpaceRepository.find_or_create(user_key: @base_space.user_key, space_type: type)
      end
    end
  end
end
