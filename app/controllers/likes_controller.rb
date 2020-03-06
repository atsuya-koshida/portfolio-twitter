class LikesController < ApplicationController
  # def create
  #   @like = Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
  #   @likes = Like.where(tweet_id: params[:tweet_id])
  #   @tweets = Tweet.all
  # end

  # def destroy
  #   like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
  #   like.destroy
  # end

  def create
    # こう記述することで、「current_userに関連したlikeクラスの新しいインスタンス」が作成可能。
    # つまり、like.user_id = current_user.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
    like = current_user.likes.build(tweet_id: params[:tweet_id])
    like.save
    redirect_to root_path
  end

  def destroy
    like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    like.destroy
    redirect_to root_path
  end
end
