class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_upload
      t.integer :user_id
    end
  end
end

