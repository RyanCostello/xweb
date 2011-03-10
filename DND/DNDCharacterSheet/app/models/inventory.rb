#Maybe have a database of inventory items and the player adds items
#to their personal inventory.  Every item needs a name and item type.
#Items can be weapon or armor and addition fields will show up depending on
#which is selected.

class Inventory < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :item_type
  
  has_many :player_inventories, :dependent => :destroy
end
