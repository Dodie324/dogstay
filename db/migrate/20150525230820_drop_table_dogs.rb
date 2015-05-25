class DropTableDogs < ActiveRecord::Migration
  def up
    drop_table :dogs
  end

  def down
    create_table :dogs
  end
end
