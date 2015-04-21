class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject, null: false
      t.text :message, null: false
      t.integer :sitter_id
      t.integer :user_id
    end
  end
end
