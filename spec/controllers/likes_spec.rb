require 'rails_helper'
RSpec.describe LikesController, type: :controller do
  def login(user)
    session[:user_id] = user.id
  end

  before(:each) do
    @user = FactoryBot.create(:user)
    @review = FactoryBot.create(:review)
    login(@user)
  end

  describe 'liking and disliking a review' do
    it 'likes a review' do
      post :create, params: { review_id: @review.id, user_id: @user.id }
      expect(response).to redirect_to(reviews_path)
      expect(flash[:notice]).to eql('You liked a review.')
    end

    it 'dislikes a post' do
      post :create, params: { review_id: @review.id, user_id: @user.id }
      expect(response).to redirect_to(reviews_path)
      expect(flash[:notice]).to eql('You liked a review.')
      delete :destroy, params: { id: Like.all[0].id, review_id: @review.id, user_id: @user.id }
      expect(response).to redirect_to(reviews_path)
      expect(flash[:notice]).to match('You disliked a review.')
    end
  end
end
