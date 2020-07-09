class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :Text
      t.integer :author_id

      t.timestamps
    end
  end
end
