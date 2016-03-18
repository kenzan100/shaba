require 'shaba'
RSpec.describe Shaba::Space do
  let(:user) { instance_double("User", name: 'yuta') }
  subject { described_class.new(user: user, type: :draft) }

  describe '#initialize' do
    it { expect(subject.user).to eq user }
    it { expect(subject.type).to eq :draft }
  end

  describe '#posts' do
    it { expect(subject.posts).to eq nil }
    context 'adding posts' do
      let(:post) { instance_double("Post") }
      before { subject.add(post) }
      it { expect(subject.posts).to eq [post] }
    end
  end
end

RSpec.describe Shaba::SpaceManager do
  let(:space_class) { Shaba::Space }
  let(:user) { instance_double("User", name: 'yuta') }
  describe '.construct_for' do
    subject { described_class.construct_for(user) }
    before  { subject }
    it { expect(subject).to contain_exactly have_attributes(user: user, type: :draft),
                                            have_attributes(user: user, type: :private) }
  end
end
