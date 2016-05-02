require "tilt"
require "shaba"
module Web
  class Application
    def call(env)
      method = env["REQUEST_METHOD"].downcase
      path   = env["PATH_INFO"]
      return [200, {}, [""]] if path == "/favicon.ico"
      req    = Rack::Request.new(env)
      ret    = actions[path.to_sym].call(req)
      routes[method.to_sym][path.to_sym].call(env, ret)
    end

    def actions
      Controller.actions
    end

    def routes
      Router.routes
    end
  end

  class Controller
    class << self
      def actions
        {
          "/": ->(req) {
          },
          "/memos": ->(req) {
            Shaba::Memo.new req.params["memo_content"]
          }
        }
      end
    end
  end

  class Router
    class << self
      def routes
        {
          post: {
            "/memos": ->(env, ret) {
              [
                200,
                { "Content-Type" => "text/html" },
                [ "memo saved.<br/> #{ret.body}" ]
              ]
            }
          },
          get: {
            "/": ->(env, ret) {
              [
                200,
                { "Content-Type" => "text/html" },
                [ Tilt.new('apps/web/templates/write_memo.html.erb').render ]
              ]
            }
          }
        }
      end
    end
  end
end

if $0 == __FILE__
  require_relative "../../config/environment"
  require 'rack'
  require 'byebug'
  Rack::Server.start(
    app:  Web::Application.new,
    Port: 9292
  )
end
