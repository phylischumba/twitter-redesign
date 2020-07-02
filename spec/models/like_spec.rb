require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:review_id) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:review) }
  end


end