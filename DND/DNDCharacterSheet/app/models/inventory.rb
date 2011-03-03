class Inventory < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :item_type
  validates_presence_of :info
  
  belongs_to :player
end
