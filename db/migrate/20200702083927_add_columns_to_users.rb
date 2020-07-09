class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Photo, :text
    add_column :users, :Coverimage, :text
  end
end
