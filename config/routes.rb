Rails.application.routes.draw do
  root to: 'pages#index'

  resources :users 
  resources :user_sessions, only: [:create, :destroy]
  resources :friendships, only: [:index, :create, :destroy, :update]
  resources :posts
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :show, :destroy]

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in

  get '/notification', action: :show, controller: 'friendships'

  get '/friend', to: 'friendships#index'

end
