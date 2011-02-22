class CreateDefenses < ActiveRecord::Migration
  def self.up
    create_table :defenses do |t|
      t.integer :AC
      t.integer :Fort
      t.integer :Reflex
      t.integer :Will
      t.integer :player_id

      t.timestamps
    end
  end

  def self.down
    drop_table :defenses
  end
end
