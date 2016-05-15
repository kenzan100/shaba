RSpec.describe 'integration flow' do
  it 'user writes memo for the first time' do
    user   = instance_double("User", name: 'yuta')
    spaces = SpaceManager.construct_for(user)
    memo   = Memo.new(body: '1st memo')
    post   = Post.new(memo)
    space  = spaces.select{|s| s.type == :draft }.first
    space.add(post)
  end
end
