require "tilt"
module Web
  class Application
    def call(env)
      method = env["REQUEST_METHOD"].downcase
      path   = env["PATH_INFO"]
      routes[method.to_sym][path.to_sym].call(env)
    end

    def routes
      Router.routes
    end
  end

  class Router
    class << self
      def routes
        {
          get: {
            "/": ->(env) {
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
