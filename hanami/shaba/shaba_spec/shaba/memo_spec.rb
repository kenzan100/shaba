require 'shaba'
RSpec.describe Shaba::Memo do
  subject { described_class.new('hello') }
  describe '#initialize' do
    it { expect { subject }.not_to raise_error }
  end

  describe '#body' do
    it { expect(subject.body).to eq 'hello' }

    context 'when updating' do
      before { subject.body = 'hello again' }
      it { expect(subject.body).to eq 'hello again' }
    end
  end
end
