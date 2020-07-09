RSpec.feature 'Following', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    @review = FactoryBot.create(:review)
    @user2 = FactoryBot.create(:user, username: 'Phylis', fullname: 'Phylis')
    visit root_path
    fill_in 'Username', with: @user.username
    click_button 'Log in'
  end
  it 'should be able to follow a user' do
    click_on @user2.fullname
    first(:css, '.fas').click
    expect(page).to have_content('LOGOUT')
  end

  it 'Should be able to unfollow a user' do
    click_on @user2.fullname
    first(:css, '.fas').click
    first(:css, '.fas').click
    expect(page).to have_content('LOGOUT')
  end
end
