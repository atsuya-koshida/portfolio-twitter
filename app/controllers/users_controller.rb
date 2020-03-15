class UsersController < ApplicationController
  before_action :set_user, only: [:show, :like]
  def show
    @tweet = Tweet.new
    @tweets = Tweet.where(user_id: params[:id]).order("created_at DESC")
    @liked_tweets = @user.liked_tweets
  end

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to root_path, notice: '会員情報を変更しました'
  end
  
  def like
    @liked_tweets = @user.liked_tweets
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end