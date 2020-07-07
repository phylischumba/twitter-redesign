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
      @user1 = FactoryBot.create(:user, username: 'Sunday', fullname: 'Alican Sunday')
      @user2 = FactoryBot.create(:user, username: 'john', fullname: 'John Doe')
      @follow = FactoryBot.create(:user, username: 'Phyl', fullname: 'Phyl Chumbaa')
      @following = FactoryBot.create(:following, follower_id: @user1.id, followed_id: @user2.id)
      # @following2 = FactoryBot.create(:following, followed_id: @user2.id, follower_id: @user1.id)
    end
    describe '.follow' do
    it 'checks if current user has followed user' do
      expected = @following
      actual = @user1.follow(@user2)
      expect(expected).to be(@following)
    end


  end

  end
end
