class CreateSkills < ActiveRecord::Migration
  def self.up
    create_table :skills do |t|
      t.integer :Acrobatics
      t.integer :Arcana
      t.integer :Athletics
      t.integer :Bluff
      t.integer :Diplomacy
      t.integer :Dungeoneering
      t.integer :Endurance
      t.integer :Heal
      t.integer :History
      t.integer :Insight
      t.integer :Intimidate
      t.integer :Nature
      t.integer :Perception
      t.integer :Religion
      t.integer :Stealth
      t.integer :Streetwise
      t.integer :Thievery
      t.integer :player_id

      t.timestamps
    end
  end

  def self.down
    drop_table :skills
  end
end
