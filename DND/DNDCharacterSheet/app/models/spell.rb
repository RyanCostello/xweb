class Spell < ActiveRecord::Base
  validates_presence_of :spell_name
  validates_presence_of :spell_damage
  validates_presence_of :spell_attack
  validates_presence_of :spell_info
  validates_presence_of :spell_class
  validates_presence_of :spell_remaining
  validates_presence_of :player_id
  
  belongs_to :player
end
