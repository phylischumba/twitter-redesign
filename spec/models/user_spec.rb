require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_most(15) }
    it { should validate_presence_of(:fullname) }
    it { should validate_length_of(:fullname).is_at_most(25) }
  end

  describe 'associations' do
    it { should have_many(:reviews).with_foreign_key(:author_id).class_name('Review') }
    it { should have_many(:likes) }
    it { should have_many(:active_followings).with_foreign_key(:follower_id).class_name('Following') }
    it { should have_many(:passive_followings).with_foreign_key(:followed_id).class_name('Following') }
    it { should have_many(:followers).through(:passive_followings).source(:follower) }
    it { should have_many(:following).through(:active_followings).source(:followed) }
  end

  describe 'user class methods' do
    before(:each) do
      @user1 = User.create!(username: 'Sun', fullname: 'Ali')
      @user2 = User.create!(username: 'Odong', fullname: 'Mike')
      @following = @user1.follow(@user2)
    end
    describe 'follow' do
      it 'checks if current user has followed user' do
        expect(@user1.following?(@user2)).to eq(true)
      end
    end
    describe 'unfollow' do
      it 'checks if current user has unfollowed user' do
        @following2 = @user1.unfollow(@user2)
        expect(@user1.following?(@user2)).to eq(false)
      end
    end
  end
end
