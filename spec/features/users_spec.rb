require 'rails_helper'

RSpec.describe 'authenticate a user', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  scenario 'sign up a user' do
    visit new_user_path
    fill_in 'Username', with: @user.username
    fill_in 'Fullname', with: @user.fullname
    click_button 'Sign Up'
  end

  scenario 'login a user' do
    visit root_url
    fill_in 'Username', with: @user.username
    click_button 'Log in'
    expect(page).to have_content('HOME')
  end

  scenario 'logout a user' do
    visit root_url
    fill_in 'Username', with: @user.username
    click_button 'Log in'
    click_link 'LOGOUT'
    expect(page).to have_content('Username')
    expect(page).to have_content('Sign up')
  end
end
