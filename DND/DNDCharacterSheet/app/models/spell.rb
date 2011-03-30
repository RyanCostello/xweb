#Maybe have a spell database and have a player select available spells to add to 
#their own "spellbook."

class Spell < ActiveRecord::Base
  validates_presence_of :spell_name
  validates_uniqueness_of :spell_name
  validates_presence_of :spell_damage
  validates_presence_of :spell_attack
  validates_presence_of :spell_info
  validates_presence_of :spell_class
  validates_presence_of :spell_remaining
  validates_presence_of :spell_modone
  validates_presence_of :spell_modtwo
  
  has_many :player_spells, :dependent => :destroy
end
