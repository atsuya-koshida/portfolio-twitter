Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :tweets
  resources :relationships, only: [:create, :destroy]
  
  post   '/like/:tweet_id' => 'likes#like',   as: 'like'
  delete '/like/:tweet_id' => 'likes#unlike', as: 'unlike'
  
  root "tweets#index"
end