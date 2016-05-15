module Space
  class Find
    def initialize(type)
      @type = type.to_sym
    end

    def run
      spaces = ConstructFor.new(ENV["USER"]).run
      spaces.detect { |s| s.space_type.to_sym == @type }
    end
  end
end
