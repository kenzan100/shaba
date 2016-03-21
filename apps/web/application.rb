module Web
  class Application
    def call(env)
      [200, {}, ["Write New Memo"]]
    end
  end
end
