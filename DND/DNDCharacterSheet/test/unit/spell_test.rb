require 'test_helper'

class SpellTest < ActiveSupport::TestCase
  test "Spell will have fields filled out" do
    p = spells(:spell_one)
    assert_not_nil(p)
    assert_not_nil(p.spell_name)
    assert_not_nil(p.spell_class)
    assert_not_nil(p.spell_info)  
    assert_not_nil(p.spell_remaining)
    assert_not_nil(p.spell_attack)
    assert_not_nil(p.spell_damage)
  end
  
  test "new spell fails to enter a name" do
    p = Spell.new
    #p.spell_name = "Sky Flourish1"
    p.spell_class = "Rogue"
    p.spell_info = "Throws Dagger"
    p.spell_remaining = "1"
    p.spell_attack = "10"
    p.spell_damage = "20"
    assert(!p.valid?)
  end
  
  test "new spell fails to enter a class" do
    p = Spell.new
    p.spell_name = "Sky Flourish2"
    #p.spell_class = "Rogue"
    p.spell_info = "Throws Dagger"
    p.spell_remaining = "1"
    p.spell_attack = "10"
    p.spell_damage = "20"
    assert(!p.valid?)
  end
  
  test "new spell fails to enter info" do
    p = Spell.new
    p.spell_name = "Sky Flourish3"
    p.spell_class = "Rogue"
    #p.spell_info = "Throws Dagger"
    p.spell_remaining = "1"
    p.spell_attack = "10"
    p.spell_damage = "20"
    assert(!p.valid?)
  end
  
  test "new spell fails to enter a remaining number" do
    p = Spell.new
    p.spell_name = "Sky Flourish4"
    p.spell_class = "Rogue"
    p.spell_info = "Throws Dagger"
    #p.spell_remaining = "1"
    p.spell_attack = "10"
    p.spell_damage = "20"
    assert(!p.valid?)
  end
  
  test "new spell fails to enter an attack number" do
    p = Spell.new
    p.spell_name = "Sky Flourish5"
    p.spell_class = "Rogue"
    p.spell_info = "Throws Dagger"
    p.spell_remaining = "1"
    #p.spell_attack = "10"
    p.spell_damage = "20"
    assert(!p.valid?)
  end
  
  test "new spell fails to enter a damage number" do
    p = Spell.new
    p.spell_name = "Sky Flourish6"
    p.spell_class = "Rogue"
    p.spell_info = "Throws Dagger"
    p.spell_remaining = "1"
    p.spell_attack = "10"
    #p.spell_damage = "20"
    assert(!p.valid?)
  end
end
