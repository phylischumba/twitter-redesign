require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_most(15) }
    it { should validate_presence_of(:fullname) }
    it { should validate_length_of(:fullname).is_at_most(25) }   
  end

  describe 'associations' do
    it { should have_many(:reviews) }
    it { should have_many(:likes) }
    it { should have_many(:followeds).with_foreign_key(:followed_id).class_name('Following') }
    it { should have_many(:followers).with_foreign_key(:follower_id).class_name('Following') }
  end
end