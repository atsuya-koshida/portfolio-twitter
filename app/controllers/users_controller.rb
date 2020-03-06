class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweet = Tweet.new
    @tweets = Tweet.where(user_id: params[:id]).order("created_at DESC")
    @liked_tweets = @user.liked_tweets
  end
end