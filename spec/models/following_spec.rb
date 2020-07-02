require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:follower_id).scoped_to(:followed_id) }
    it { should validate_uniqueness_of(:followed_id).scoped_to(:follower_id) }
  end

  describe 'associations' do
    it { should belong_to(:follower).with_foreign_key(:follower_id).class_name('User') }
    it { should belong_to(:followed).with_foreign_key(:followed_id).class_name('User') }
  end
end
