require 'memo'
RSpec.describe Memo do
  subject { Memo.new('hello') }
  describe '#initialize' do
    it { expect { subject }.not_to raise_error }
  end

  describe 'body attribute' do
    it { expect(subject.body).to eq 'hello' }
  end
end
