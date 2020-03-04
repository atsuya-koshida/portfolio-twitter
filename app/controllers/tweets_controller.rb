class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :show, :destroy]
  
  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: 'ツイートを送信しました'
    else
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to root_path, notice: 'ツイートを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to root_path, alert: 'ツイートを削除しました'
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, images: []).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
