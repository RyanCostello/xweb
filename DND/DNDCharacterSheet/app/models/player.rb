#Comments
#Ryan Costello

class Player < ActiveRecord::Base
  validates_presence_of :character_name
  validates_presence_of :character_level
  validates_presence_of :character_class
  
  has_many :stats, :dependent => :destroy
  has_many :skills, :dependent => :destroy
  has_many :defenses, :dependent => :destroy
  has_many :spells, :dependent => :destroy
  has_many :inventories, :dependent => :destroy
end
