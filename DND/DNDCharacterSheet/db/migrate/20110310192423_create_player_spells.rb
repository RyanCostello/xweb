class CreatePlayerSpells < ActiveRecord::Migration
  def self.up
    create_table :player_spells do |t|
      t.integer :player_id
      t.integer :spell_id

      t.timestamps
    end
  end

  def self.down
    drop_table :player_spells
  end
end
