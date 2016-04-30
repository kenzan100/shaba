require 'shaba'
RSpec.describe 'integration flow' do
  it 'user writes memo for the first time' do
    user   = instance_double("User", name: 'yuta')
    spaces = Shaba::SpaceManager.construct_for(user)
    memo   = Shaba::Memo.new('1st memo')
    post   = Shaba::Post.new(memo)
    space  = spaces.select{|s| s.type == :draft }.first
    space.add(post)
  end
end
