require_relative "../config/environment"

Dir[__dir__ + "/support/**/*.rb"].each do |f|
  require f
end

RSpec.configure do |config|
  config.expect_with :rspec
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  if config.files_to_run.one?
    config.default_formatter = :doc
  end

  config.order = :random
  Kernel.srand config.seed
end
