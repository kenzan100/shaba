require 'memo'
RSpec.describe Memo do
  subject { Memo.new('hello') }
  describe '#initialize' do
    it { expect { subject }.not_to raise_error }
  end

  describe 'body attribute' do
    it { expect(subject.body).to eq 'hello' }

    context 'when updating' do
      before { subject.body = 'hello again' }
      it { expect(subject.body).to eq 'hello again' }
    end

    context 'when blank' do
      it { expect { subject.body = '' }.to raise_error(Memo::BodyMustBePresentError) }
    end
  end
end
