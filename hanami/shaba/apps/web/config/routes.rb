# Configure your routes here
# See: http://www.rubydoc.info/gems/hanami-router/#Usage

get  '/', to: 'memos#new'

resources :memos do
  member do
    patch :reorder
  end
end
