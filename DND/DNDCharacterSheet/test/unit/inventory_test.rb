require 'test_helper'

class InventoryTest < ActiveSupport::TestCase
  
  test "Type Armor will have fields filled out" do
    p = inventories(:one)
    assert_not_nil(p)
    assert_not_nil(p.item_type)
    assert_not_nil(p.slot)
    assert_not_nil(p.name)  
    assert_nil(p.damage)
    assert_not_nil(p.bAC)
    assert_not_nil(p.bFort)
    assert_not_nil(p.bWill)
    assert_not_nil(p.bReflex)    
  end
  
  test "Type Weapon will have fields filled out" do
    p = inventories(:two)
    assert_not_nil(p)
    assert_not_nil(p.item_type)
    assert_not_nil(p.slot)
    assert_not_nil(p.name)  
    assert_not_nil(p.damage)
    assert_nil(p.bAC)
    assert_nil(p.bFort)
    assert_nil(p.bWill)
    assert_nil(p.bReflex)    
  end
  
  test "new inventory fails to enter a item_type" do
    p = Inventory.new
    #p.item_type = "Armor"
    p.slot = "Helm"
    p.name = "Great Helm0"
    p.info = "It's Pointy"
    p.damage = ""
    p.bAC = "1"
    p.bFort = "1"
    p.bWill = "0"
    p.bReflex = "0"
    assert(!p.valid?)
  end
  
  test "new inventory fails to enter a slot" do
    p = Inventory.new
    p.item_type = "Armor"
    #p.slot = "Helm"
    p.name = "Great Helm1"
    p.info = "It's Pointy"
    p.damage = ""
    p.bAC = "1"
    p.bFort = "1"
    p.bWill = "0"
    p.bReflex = "0"
    assert(!p.valid?)
  end
  
  test "new inventory fails to enter a name" do
    p = Inventory.new
    p.item_type = "Armor"
    p.slot = "Helm"
    #p.name = "Great Helm2"
    p.info = "It's Pointy"
    p.damage = ""
    p.bAC = "1"
    p.bFort = "1"
    p.bWill = "0"
    p.bReflex = "0"
    assert(!p.valid?)
  end
  
  test "new inventory check for uniqueness of name" do
    p = Inventory.create
    p.item_type = "Armor"
    p.slot = "Helm"
    p.name = "Sharp Helm"
    p.info = "It's Pointy"
    p.damage = ""
    p.bAC = "1"
    p.bFort = "1"
    p.bWill = "0"
    p.bReflex = "0"
    p.save
    assert(p.valid?)
  
    p = Inventory.new
    p.item_type = "Armor"
    p.slot = "Helm"
    p.name = "Sharp Helm"
    p.info = "It's Pointy"
    p.damage = ""
    p.bAC = "1"
    p.bFort = "1"
    p.bWill = "0"
    p.bReflex = "0"
    assert(!p.valid?)
  end
end
