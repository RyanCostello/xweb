class Stat < ActiveRecord::Base
  validates_presence_of :strength
  validates_presence_of :constitution
  validates_presence_of :dexterity
  validates_presence_of :wisdom
  validates_presence_of :charisma
  validates_presence_of :intellect
  
  belongs_to :player
end
