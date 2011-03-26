class CreateInventories < ActiveRecord::Migration
  def self.up
    create_table :inventories do |t|
      t.string :item_type
      t.string :slot
      t.string :name
      t.string :info
      t.integer :damage
      t.integer :bAC
      t.integer :bFort
      t.integer :bWill
      t.integer :bReflex

      t.timestamps
    end
  end

  def self.down
    drop_table :inventories
  end
end
