class RemoveIndexFromFollowing < ActiveRecord::Migration[6.0]
  def change
    remove_index :followings, name: "index_followings_on_follower_id_and_followed_id"
  end
end
