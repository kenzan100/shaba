require 'memo'
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

    context 'with OreHanami::Validations' do
      it { is_expected.to be_valid }
      context 'when body blank' do
        before { subject.body = '' }
        it { is_expected.to be_invalid }
      end
    end
  end
end
