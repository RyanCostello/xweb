#List of player id mapped to inventory id
#Links player with items

class PlayerInventory < ActiveRecord::Base
  belongs_to :player
  belongs_to :inventory
end