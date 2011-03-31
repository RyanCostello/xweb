#Makes sure our Spell and Player tables are connected when deleted.
class PlayerSpell < ActiveRecord::Base 
  belongs_to :spell
  belongs_to :player
end
