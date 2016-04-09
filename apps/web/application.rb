require "tilt"
module Web
  class Application
    def call(env)
      method = env["REQUEST_METHOD"].downcase
      path   = env["PATH_INFO"]
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
          "/": ->(req) { },
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
                {},
                [ "memo #{ret.body} saved" ]
              ]
            }
          },
          get: {
            "/": ->(env, ret) {
              [
                200,
                {},
                [ Tilt.new('apps/web/templates/write_memo.html.erb').render ]
              ]
            }
          }
        }
      end
    end
  end
end
