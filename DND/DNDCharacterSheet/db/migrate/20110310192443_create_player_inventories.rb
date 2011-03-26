class CreatePlayerInventories < ActiveRecord::Migration
  def self.up
    create_table :player_inventories do |t|
      t.integer :player_id
      t.integer :inventory_id

      t.timestamps
    end
  end

  def self.down
    drop_table :player_inventories
  end
end
