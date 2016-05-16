require './config/environment'

use Rack::Static, root: "public", urls: %w(/assets)
run Hanami::Container.new
