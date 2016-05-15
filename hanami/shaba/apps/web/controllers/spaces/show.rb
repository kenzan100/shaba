module Web::Controllers::Spaces
  class Show
    include Web::Action

    expose :posts

    def call(params)
      space = Space::Find.new(params[:type]).run
      @posts = space.posts
    end
  end
end
