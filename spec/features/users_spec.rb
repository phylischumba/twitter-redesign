# require 'rails_helper'

# RSpec.describe 'authenticate a user', type: :feature do
#   let(:user) { User.create(username: 'Mercy', fullname: "Mercy Adelle") }

#   scenario 'sign up a user' do
#     user = FactoryBot.create(:user)
#     visit new_user_path
#     fill_in 'user_username', with: user.username
#     fill_in 'user_fullname', with: user.fullname
#     click_button 'Create User'
#     expect(page).to have_content('Log in')
#   end

#   scenario 'login a user' do
#     user = FactoryBot.create(:user)
#     visit root_url
#     fill_in 'username', with: user.username
#     click_button 'Log in'
#     expect(page).to have_content('Tweets')

#   end

#   scenario 'logout a user' do
#     user = FactoryBot.create(:user)
#     visit root_url
#     fill_in 'username', with: user.username
#     click_button 'Log in'
#     click_on 'LOG OUT'
#     expect(page).to have_content('Username')
#     expect(page).to have_content('Sign up')
#   end
# end
