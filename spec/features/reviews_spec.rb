require 'rails_helper'
RSpec.describe 'Review', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    @review = FactoryBot.create(:review)
    visit root_path
    fill_in 'Username', with: @user.username
    click_button 'Log in'
  end

  scenario 'creating valid review' do
    expect(page.current_path).to eq '/reviews'
    page.fill_in 'review[Text]', with: 'Testing review'
    click_button 'Tweet review'
    expect(page).to have_text 'Testing review'
  end
end
