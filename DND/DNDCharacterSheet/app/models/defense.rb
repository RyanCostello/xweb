#Calculated from stats and are unique to a character.

class Defense < ActiveRecord::Base
    belongs_to :player
end
