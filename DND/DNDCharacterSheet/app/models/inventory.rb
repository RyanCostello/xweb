class Inventory < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :type
  validates_presence_of :info
end
