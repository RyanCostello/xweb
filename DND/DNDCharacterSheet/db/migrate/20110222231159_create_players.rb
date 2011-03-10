class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :character_name
      t.string :character_class
      t.integer :character_initiative
      t.integer :character_level
      t.integer :strength
      t.integer :constitution
      t.integer :dexterity
      t.integer :intellect
      t.integer :wisdom
      t.integer :charisma

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
