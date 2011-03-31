class PlayerSpell < ActiveRecord::Base 
  belongs_to :spell
  belongs_to :player
end
