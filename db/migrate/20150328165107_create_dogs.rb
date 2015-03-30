class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string  :name, null: false
      t.integer :age, null: false
      t.string  :breed, null: false
      t.string  :size, null: false
      t.boolean :fixed, null: false
      t.boolean :health_condition, null: false
      t.integer :owner_id, null: false
      t.integer :sitter_id

      t.timestamps
    end
  end
end
