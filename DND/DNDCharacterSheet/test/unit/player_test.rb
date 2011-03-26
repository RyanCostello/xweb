require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  
  test "valid character" do
    p = Player.new
    p.character_name = "Silver"
    p.character_class = "Rogue"
    p.character_level = "11"
    p.strength = "13"
    p.constitution = "10"
    p.dexterity = "21"
    p.wisdom = "8"
    p.charisma = "12"
    p.intellect = "8"
    assert(p.valid?)
  end
  
  test "existing character defines these fields" do
    p = players(:player_1)
    assert_not_nil(p)
    assert_not_nil(p.character_name)
    assert_not_nil(p.character_class)
    assert_not_nil(p.character_level)
    assert_not_nil(p.strength)  
    assert_not_nil(p.constitution)
    assert_not_nil(p.dexterity)
    assert_not_nil(p.wisdom)
    assert_not_nil(p.charisma)
    assert_not_nil(p.intellect)
  end
  
  test "new character fails to enter a Name" do
    p = Player.new
    #p.character_name = "Silver1"
    p.character_class = "Rogue"
    p.character_level = "11"
    p.strength = "13"
    p.constitution = "10"
    p.dexterity = "21"
    p.wisdom = "8"
    p.charisma = "12"
    p.intellect = "8"
    assert(!p.valid?)
  end
  
  #Name 'Silver' already exist
  test "new character Name already exist" do
    p = Player.create
    p.character_name = "Joe"
    p.character_class = "Rogue"
    p.character_level = "11"
    p.strength = "13"
    p.constitution = "10"
    p.dexterity = "21"
    p.wisdom = "8"
    p.charisma = "12"
    p.intellect = "8"
    p.save
    assert(p.valid?)
    
    r = Player.new
    r.character_name = "Joe"
    r.character_class = "Rogue"
    r.character_level = "11"
    r.strength = "13"
    r.constitution = "10"
    r.dexterity = "21"
    r.wisdom = "8"
    r.charisma = "12"
    r.intellect = "8"
    assert(!r.valid?)
  end

  test "new character fails to enter a Class" do
    p = Player.new
    p.character_name = "Faith1"
    #p.character_class = "Rogue"
    p.character_level = "11"
    p.strength = "13"
    p.constitution = "10"
    p.dexterity = "21"
    p.wisdom = "8"
    p.charisma = "12"
    p.intellect = "8"
    assert(!p.valid?)
  end
  
  test "new character fails to enter a Level" do
    p = Player.new
    p.character_name = "Faith2"
    p.character_class = "Rogue"
    #p.character_level = "11"
    p.strength = "13"
    p.constitution = "10"
    p.dexterity = "21"
    p.wisdom = "8"
    p.charisma = "12"
    p.intellect = "8"
    assert(!p.valid?)
  end
  
  test "new character fails to enter a value for Strength" do
    p = Player.new
    p.character_name = "Faith3"
    p.character_class = "Rogue"
    p.character_level = "11"
    #p.strength = "13"
    p.constitution = "10"
    p.dexterity = "21"
    p.wisdom = "8"
    p.charisma = "12"
    p.intellect = "8"
    assert(!p.valid?)
  end

  test "new character fails to enter a value for Constitution" do
    p = Player.new
    p.character_name = "Faith4"
    p.character_class = "Rogue"
    p.character_level = "11"
    p.strength = "13"
    #p.constitution = "10"
    p.dexterity = "21"
    p.wisdom = "8"
    p.charisma = "12"
    p.intellect = "8"
    assert(!p.valid?)
  end
  
  test "new character fails to enter a value for Dexterity" do
    p = Player.new
    p.character_name = "Faith5"
    p.character_class = "Rogue"
    p.character_level = "11"
    p.strength = "13"
    p.constitution = "10"
    #p.dexterity = "21"
    p.wisdom = "8"
    p.charisma = "12"
    p.intellect = "8"
    assert(!p.valid?)
  end
  
  test "new character fails to enter a value for Wisdom" do
    p = Player.new
    p.character_name = "Faith6"
    p.character_class = "Rogue"
    p.character_level = "11"
    p.strength = "13"
    p.constitution = "10"
    p.dexterity = "21"
    #p.wisdom = "8"
    p.charisma = "12"
    p.intellect = "8"
    assert(!p.valid?)
  end
  
  test "new character fails to enter a value for Charisma" do
    p = Player.new
    p.character_name = "Faith7"
    p.character_class = "Rogue"
    p.character_level = "11"
    p.strength = "13"
    p.constitution = "10"
    p.dexterity = "21"
    p.wisdom = "8"
    #p.charisma = "12"
    p.intellect = "8"
    assert(!p.valid?)
  end
  
  test "new character fails to enter a value for Intellect" do
    p = Player.new
    p.character_name = "Faith8"
    p.character_class = "Rogue"
    p.character_level = "11"
    p.strength = "13"
    p.constitution = "10"
    p.dexterity = "21"
    p.wisdom = "8"
    p.charisma = "12"
    #p.intellect = "8"
    assert(!p.valid?)
  end
  
end