class AddIndexToFollowing < ActiveRecord::Migration[6.0]
  def change
    add_index :followings, %i[follower_id followed_id], unique: true
  end
end
