require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:follower_id).scoped_to(:followed_id) }
    it { should validate_uniqueness_of(:followed_id).scoped_to(:follower_id) }
  end

  describe 'associations' do
    it { should belong_to(:follower).class_name('User') }
    it { should belong_to(:followed).class_name('User') }
  end
end
