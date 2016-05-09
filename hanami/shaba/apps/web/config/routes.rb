# Configure your routes here
# See: http://www.rubydoc.info/gems/hanami-router/#Usage

get  '/',      to: 'memos#new'
post '/memos', to: 'memos#create'
get  '/memos', to: 'memos#index'
