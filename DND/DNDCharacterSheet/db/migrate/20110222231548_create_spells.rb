class CreateSpells < ActiveRecord::Migration
  def self.up
    create_table :spells do |t|
      t.string :spell_name
      t.string :spell_class
      t.string :spell_info
      t.integer :spell_remaining
      t.string :spell_attack
      t.string :spell_damage
      t.integer :player_id

      t.timestamps
    end
  end

  def self.down
    drop_table :spells
  end
end
