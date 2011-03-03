class CreateInventories < ActiveRecord::Migration
  def self.up
    create_table :inventories do |t|
      t.string :item_type
      t.boolean :equipped
      t.string :name
      t.string :info
      t.string :attack
      t.string :dual_wield
      t.string :benefit
      t.integer :player_id

      t.timestamps
    end
  end

  def self.down
    drop_table :inventories
  end
end
