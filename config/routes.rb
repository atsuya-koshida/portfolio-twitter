Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
      get 'like', to: 'users#like'
    end
  end
  resources :tweets do
    resource :likes, only: [:create, :destroy]
    resource :comments, only: :create
  end
  resources :relationships, only: [:create, :destroy]
  
  root "tweets#index"
end