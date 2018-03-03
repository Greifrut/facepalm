Rails.application.routes.draw do
  root to: 'pages#index'

  resources :users,         only: [:new, :create, :index, :show]
  resources :user_sessions, only: [:create, :destroy]

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in

end
