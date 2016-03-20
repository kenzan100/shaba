require 'rack'
module Web
  class Application
    def call(env)
      [200, {}, ["Hello World"]]
    end
  end
end
