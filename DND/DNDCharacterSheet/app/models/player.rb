#Ryan Costello
#Cascading deletes, if a player is deleted then the associated 
#tables are deleted as well.  Name, level, class are all mandatory.  Initiative will be calculated.

class Player < ActiveRecord::Base
  validates_presence_of :character_name
  validates_presence_of :character_level
  validates_presence_of :character_class
  
  has_many :skills, :dependent => :destroy
  has_many :defenses, :dependent => :destroy
end
