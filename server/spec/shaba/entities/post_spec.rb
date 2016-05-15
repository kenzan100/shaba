RSpec.describe Post do
  let(:memo_class)  { Memo }
  let(:first_memo)  { memo_class.new(body: '1st') }
  let(:second_memo) { memo_class.new(body: '2nd') }
  subject { described_class.new(first_memo, second_memo) }
  describe '#initialize' do
    it { expect { subject }.not_to raise_error }
  end

  describe '#memos' do
    it { expect(subject.memos.first).to eq first_memo }

    context 'when reordering' do
      it{ expect(subject.reorder(1, 0).memos).to eq [second_memo, first_memo] }
      context 'when reordering partially' do
        let(:another_memo) { memo_class.new(body: 'another') }
        before { subject.add(another_memo) }
        it { expect(subject.reorder(2).memos).to eq [another_memo, first_memo, second_memo] }
      end
    end
  end

  describe '#add' do
    let(:another_memo) { memo_class.new(body: 'another') }
    it { expect(subject.add(another_memo).memos).to eq [first_memo, second_memo, another_memo] }
  end
end
