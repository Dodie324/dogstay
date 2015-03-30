class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
