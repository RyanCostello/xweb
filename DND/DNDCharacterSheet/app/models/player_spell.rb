class PlayerSpell < ActiveRecord::Base
  validates_uniqueness_of :spell_id
  
  belongs_to :spell
end
