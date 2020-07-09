require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  def login(user)
    session[:user_id] = user.id
  end

  before(:each) do
    @user = FactoryBot.create(:user)

    login(@user)
  end

  describe 'GET #new' do
    it 'gets all the users and render index page' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    it 'gives the user show page' do
      get :show, params: { id: @user.id }
      expect(response).to be_successful
      expect(response).to render_template(:show)
    end
  end
end
