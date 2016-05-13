module Space
  class FindDraft
    def run
      spaces = ConstructFor.new(ENV["USER"]).run
      spaces.detect { |s| s.space_type == "draft" }
    end
  end
end
