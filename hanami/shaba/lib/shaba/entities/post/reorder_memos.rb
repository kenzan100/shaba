module Post
  class ReorderMemos
    def reorder(*order_indices)
      reordered_memos = []
      order_indices.each_with_index do |current_i, desired_i|
        reordered_memos[desired_i] = memos[current_i]
      end
      rest_memos = memos - reordered_memos
      self.memos = (reordered_memos + rest_memos).compact
      self
    end
  end
end
