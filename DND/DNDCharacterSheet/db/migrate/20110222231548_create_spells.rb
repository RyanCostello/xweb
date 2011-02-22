class CreateSpells < ActiveRecord::Migration
  def self.up
    create_table :spells do |t|
      t.string :Spell_name
      t.string :Spell_class
      t.string :Spell_info
      t.integer :Spell_remaining
      t.string :Spell_attack
      t.string :Spell_damage

      t.timestamps
    end
  end

  def self.down
    drop_table :spells
  end
end
