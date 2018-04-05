Rails.application.routes.draw do

  get 'friendships/create'

  get 'friendships/update'

  get 'friendships/destroy'

  root to: 'pages#index'

  resources :users 
  resources :user_sessions, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy, :update]
  resources :posts
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :show, :destroy]

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in

end
