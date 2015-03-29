class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :breed, null: false
      t.string :size, null: false
      t.boolean :fixed, null: false
      t.integer :user_id, null: false
    end
  end
end
