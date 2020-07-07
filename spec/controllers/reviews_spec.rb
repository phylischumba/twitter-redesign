
require 'rails_helper'
RSpec.describe ReviewsController, type: :controller do
  
  def login(user)
    session[:user_id] = user.id
  end

  before(:each) do
    @user = FactoryBot.create(:user)
    @review = FactoryBot.create(:review)
    login(@user)
  end
  describe 'GET #index' do
    it 'gets all the user reviews and render index page' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    context 'valid params' do
      it 'creates a new review' do
        post :create, params: { review: { Text: 'Sample review', author_id: @user.id } }
        expect(response).to redirect_to(reviews_path)
      end
    end

    context 'invalid params' do
      it 'redirects to index page with invalid params' do
        post :create, params: { review: { Text: 1234 } }
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
end