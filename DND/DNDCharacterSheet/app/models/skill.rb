#Skills belong to a player and are calculated from the player.

class Skill < ActiveRecord::Base
  belongs_to :player
end
