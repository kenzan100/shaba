module RSpec
  module FeatureExampleGroup
    def self.included(group)
      group.metadata[:type] = :feature
      # TODO this needs understanding of Hanami::Container initializer
      # Capybara.app = SomethingThatLoadsShabaApp
    end
  end
end
