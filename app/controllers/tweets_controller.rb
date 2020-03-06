class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :show, :destroy]
  before_action :set_like, only: [:index, :show]
  
  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
    @tweet = Tweet.new
    @like = Like.new
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
    @like = Like.new
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
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

  def set_like
    @like = Like.new
  end
end
