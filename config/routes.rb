Rails.application.routes.draw do
  root to: 'chats#index'

  get 'auth', to: 'auth#index'
  post 'auth/login', to: 'auth#login'

  resources :messages
  resources :users
  # root to: 'home#index'
end
