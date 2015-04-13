class CreateUsersreviews < ActiveRecord::Migration
  def change
    create_table :user_reviews do |t|
      t.integer :review_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
