class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :follower_id, presence: true, uniqueness: { scope: :followed_id }
  validates :followed_id, presence: true, uniqueness: { scope: :follower_id }

  def self.find_friend_to_unfollow(sender_id, receiver_id)
    Following.where(follower_id: sender_id).where(followed_id: receiver_id)[0]
  end
end
