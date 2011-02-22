class CreateStats < ActiveRecord::Migration
  def self.up
    create_table :stats do |t|
      t.integer :strength
      t.integer :constitution
      t.integer :dexterity
      t.integer :intellect
      t.integer :wisdom
      t.integer :charisma
      t.integer :player_id

      t.timestamps
    end
  end

  def self.down
    drop_table :stats
  end
end
