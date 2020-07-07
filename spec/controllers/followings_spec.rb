require 'rails_helper'
RSpec.describe FollowingsController, type: :controller do

  def login(user)
    session[:user_id] = user.id
  end

  before(:each) do
    @user = FactoryBot.create(:user)
    @friend = FactoryBot.create(:user, username: 'test', fullname: 'John Doe')
    login(@user)
  end

  describe 'POST #create' do
    
    it 'creates a new following' do
      post :create, params: { follow: { follower_id: @user.id, followed_id: @friend } }
      expect(response).to redirect_to(@user)
    end
 
    
  end

  describe 'DELETE#destroy' do
    
    it 'destroys a following' do
      delete :create, params: { follow: { follower_id: @user.id, followed_id: @friend } }
      expect(response).to redirect_to(@user)
    end
  
  end
end