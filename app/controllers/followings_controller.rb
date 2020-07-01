class FollowingsController < ApplicationController
  def create
    
    Following.create(follower_id: current_user.id, followed_id: params[:followed_id]) 
    redirect_to user_path(params[:followed_id])
  end

  def destroy
    user = Following.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user_path(params[:followed_id])
  end
end
