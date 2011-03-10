#Skills belong to a player and are calculated from the stats.

class Skill < ActiveRecord::Base
  belongs_to :player
end
