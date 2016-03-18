Dir["#{__dir__}/shaba/**/*.rb"].each do |file|
  require_relative file
end
require_relative 'space'
