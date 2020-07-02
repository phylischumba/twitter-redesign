require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:Text) }
    it { should validate_length_of(:Text).is_at_most(300) }
    it { should_not allow_value(' ').for(:Text) }
  end

  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:likes) }
  end
end