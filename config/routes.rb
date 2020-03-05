Rails.application.routes.draw do
  devise_for :users
  root "tweets#index"
  resources :users, only: [:show]
  resources :tweets
  resources :relationships, only: [:create, :destroy]
end