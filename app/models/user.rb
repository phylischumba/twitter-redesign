class User < ApplicationRecord
  has_many :reviews, foreign_key: 'author_id', class_name: 'Review', dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :followeds, foreign_key: 'followed_id', class_name: 'Following'
  has_many :followers, foreign_key: 'follower_id', class_name: 'Following'
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 15 }
  validates :fullname, presence: true, length: { maximum: 25 }


  def self.user_followers(id, curr_user_id)
    Following.where(followed_id: id).where.not(follower_id: curr_user_id).order(created_at: :desc).limit(5)
  end

  def self.all_users(user_id)
    User.where('id != ?', user_id)
  end

end
