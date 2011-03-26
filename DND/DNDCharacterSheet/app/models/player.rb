#Ryan Costello
#Cascading deletes, if a player is deleted then the associated 
#tables are deleted as well.  Name, level, class, and all stats are all mandatory.  Initiative will be calculated.

class Player < ActiveRecord::Base
  validates_presence_of :character_name
  validates_presence_of :character_level
  validates_presence_of :character_class
  validates_presence_of :strength
  validates_presence_of :constitution
  validates_presence_of :dexterity
  validates_presence_of :intellect
  validates_presence_of :wisdom
  validates_presence_of :charisma
  
  has_many :skills, :dependent => :destroy
  has_many :defenses, :dependent => :destroy
end
