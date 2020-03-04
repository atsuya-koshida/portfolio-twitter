class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  
  def index
    @tweets = Tweet.where(user_id: current_user.id).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      # flash.now[:alert] = '出品に失敗しました'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    tweet = tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :content, images: []).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
