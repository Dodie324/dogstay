class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string   :name, null: false
      t.integer  :age, null: false
      t.string   :breed, null: false
      t.string   :size, null: false
      t.string   :gender, null: false
      t.boolean  :fixed, null: false
      t.boolean  :health_condition, null: false
      t.string   :image, null: false
      t.integer  :user_id

      t.timestamps
    end
  end
end
