require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_most(10) }
    it { should validate_presence_of(:fullname) }
    it { should validate_length_of(:fullname).is_at_most(20) }
    it { should validate_uniqueness_of(:username) }
   
  end
end