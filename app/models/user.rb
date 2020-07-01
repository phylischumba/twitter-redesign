class User < ApplicationRecord
  has_many :reviews, foreign_key: 'author_id', class_name: 'Review', dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :active_following, foreign_key: "follower_id", class_name: "Following", dependent: :destroy
  has_many :passive_following, class_name: "Following", foreign_key: "followed_id", dependent: :destroy
  has_many :followeds, through: :active_following, source: :followed
  has_many :followers, through: :passive_following, source: :follower


  def follow(other_user)
    active_following.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_following.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    followeds.include?(other_user)
  end

end
