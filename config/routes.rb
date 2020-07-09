Rails.application.routes.draw do
  resources :reviews, only: [:index, :create, :destroy, :show]
  resources :users 
  root to: 'sessions#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :reviews do
    resources :likes
  end
  resources :followings, only: [:create, :destroy]
  
end
