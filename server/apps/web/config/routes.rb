# Configure your routes here
# See: http://www.rubydoc.info/gems/hanami-router/#Usage

get  '/', to: 'memos#new'

resources :memos
resources :posts

get '/spaces/:type', to: 'spaces#show', as: :space
