module RSpec
  module FeatureExampleGroup
    def self.included(group)
      group.metadata[:type] = :feature
      Capybara.app = Web::Application.new
    end
  end
end
