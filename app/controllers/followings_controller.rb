class FollowingsController < ApplicationController
  before_action :find_user

  def new
  end

  def create
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

  def destroy
    current_user.unfollow(@user)
    redirect_to user_path(@user)
  end

  private
  def find_user
    @user = User.find(params[:user_id])
  end
end
