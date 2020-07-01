Rails.application.routes.draw do
  resources :reviews, only: [:index, :create, :destroy, :show]
  resources :users do
    get :followed, :follower
  end
  root to: 'sessions#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :reviews do
    resources :likes
  end
  get '/follow/:followed_id', to: 'followings#create', as: :follow
  delete '/:followed_id', to: 'followings#destroy', as: :unfollow
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
