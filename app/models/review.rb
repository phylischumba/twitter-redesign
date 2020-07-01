class Review < ApplicationRecord
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  belongs_to :author, dependent: :destroy, class_name: 'User'
  has_many :likes, dependent: :destroy
  
end
