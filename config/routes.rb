Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :tweets do
    resource :likes, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  
  root "tweets#index"
end