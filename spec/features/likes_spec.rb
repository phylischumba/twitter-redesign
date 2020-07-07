require 'rails_helper'
RSpec.describe 'Like', type: :feature do

  before(:each) do
    @user = FactoryBot.create(:user)
    @review = FactoryBot.create(:review)
    visit root_path
    fill_in 'Username', with: @user.username
    click_button 'Log in'
  end

  scenario 'creating valid comment' do
    visit reviews_path
    click_on 'Like!'
    expect(page).to have_content('Dislike!')
  end
end