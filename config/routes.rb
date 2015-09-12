Rails.application.routes.draw do
  resources :comments
  resources :image_posts
  resources :text_posts
  resources :posts
  resources :users
  resources :sessions
  
  #sets url from users/new -> /signup
  get 'signup', to: 'users#new', as: 'signup'
  
  #establish sessions for sessions/new || destroy -> /login && logout
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  root 'posts#index'
  
end
