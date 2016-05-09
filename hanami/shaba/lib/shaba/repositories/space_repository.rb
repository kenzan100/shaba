class SpaceRepository
  include Hanami::Repository

  class << self
    def deep_create(space)
      find_or_create(space)
      space.posts.each do |post|
        PostRepository.find_or_create(post)
        post.memos.each do |memo|
          MemoRepository.find_or_create(memo)
        end
      end
    end

    def find_or_create(space)
      uniq = query do where(type: space.type.to_s) end
      return uniq.first if uniq.exist?
      create space
    end
  end
end
