class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweet = Tweet.new
    @tweets = Tweet.where(user_id: params[:id]).order("created_at DESC")
    @liked_tweets = @user.liked_tweets
  end

  def like
    @user = User.find(params[:id])
    @liked_tweets = @user.liked_tweets
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :image)
  end
end