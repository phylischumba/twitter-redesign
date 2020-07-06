class User < ApplicationRecord
  has_many :reviews, foreign_key: 'author_id', class_name: 'Review', dependent: :destroy
  has_many :likes, dependent: :destroy
 
  has_many :active_followings, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_followings, class_name: 'Following', foreign_key: 'followed_id', dependent: :destroy

  has_many :followers, through: :passive_followings, source: :follower
  has_many :following, through: :active_followings, source: :followed

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 15 }
  validates :fullname, presence: true, length: { maximum: 25 }

  def self.user_followers(id, curr_user_id)
    Following.where(followed_id: id).where.not(follower_id: curr_user_id).order(created_at: :desc).limit(5)
  end

   
  def follow(user)
    active_followings.create(followed_id: user.id)
  end

  def unfollow(user)
    active_followings.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end
end
