Rails.application.routes.draw do
  resources :friend_requests
  resources :support_items
  resources :friendships
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/login', to: 'auth#login'
end
