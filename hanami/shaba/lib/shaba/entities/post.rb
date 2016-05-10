class Post
  include Hanami::Entity

  attr_accessor :memos, :title
  def initialize(*memos)
    self.memos = []
    self.memos = memos unless memos.nil?
    self.title = "post title"
  end

  def reorder(*order_indices)
    reordered_memos = []
    order_indices.each_with_index do |current_i, desired_i|
      reordered_memos[desired_i] = memos[current_i]
    end
    rest_memos = memos.reject{ |memo| order_indices.include? memos.index(memo) }
    self.memos = (reordered_memos + rest_memos).compact
    self
  end

  def add(memo)
    self.memos = (memos || []) << memo
    self
  end
end
