RSpec.describe Memo::Organizer do
  let(:memo_pushed) {
    MemoRepository.create(body: "fuga", post_id: 10)
  }
  let(:memo) {
    MemoRepository.new(sort_order: 10)
  }
  it "reorder memos" do
    params = {
      "up_or_down"   => :gte,
      "next_memo_id" => memo_pushed.id,
      "pushed_by"    => 10,
      "moved_by"     => -1
    }
    original_sort_order = memo_pushed.sort_order
    expected_sort_order = original_sort_order + 10
    Memo::Organizer.new(memo).send(:reorder, params)
    expect(memo_pushed.reload.sort_order).to eq expected_sort_order
    expect(memo.sort_order).to eq original_sort_order - 1
  end
end
