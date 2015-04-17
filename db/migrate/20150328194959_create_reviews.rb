class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer  :rating, null: false
      t.text     :body, null: false
      t.integer  :sitter_id
      t.integer  :user_id

      t.timestamps
    end
  end
end
