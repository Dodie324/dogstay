class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      t.string  :first_name,                 null: false
      t.string  :last_name,                  null: false
      t.string  :zipcode,                    null: false
      t.boolean :sitter,                     null: false
      t.text    :headline
      t.text    :description
      t.string  :address1
      t.string  :address2
      t.string  :city
      t.string  :state
      t.string  :phone_number
      t.boolean :have_dogs
      t.boolean :have_children
      t.string  :property_type
      t.string  :yard_type
      t.string  :price
      t.string  :availability


      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :phone_number,         unique: true
  end
end
