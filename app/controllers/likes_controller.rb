class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(review_id: params[:review_id])

    if @like.save
      redirect_to reviews_path, notice: 'You liked a review.'
    else
      redirect_to reviews_path, alert: 'You cannot like this review.'
    end
  end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user, review_id: params[:review_id])
    if like
      like.destroy
      redirect_to reviews_path, notice: 'You disliked a review.'
    else
      redirect_to reviews_path, alert: 'You cannot dislike review that you did not like before.'
    end
  end
end
