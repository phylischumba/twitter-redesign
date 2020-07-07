class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.all
    @followers = User.user_followers(params[:id], current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
    if @user.save
     
        format.html { redirect_to login_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      
    else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
       end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :fullname, :Photo)
  end
end
