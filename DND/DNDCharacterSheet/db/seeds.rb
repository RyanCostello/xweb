# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts "Destroying all data!"
Player.destroy_all
Spell.destroy_all
Inventory.destroy_all

(1..10).each do |n|
  p = Player.new
  p.character_name = "Faith #{n}"
  p.character_class = "Rogue"
  p.character_initiative = "11"
  p.character_level = "12"
  p.strength = "13"
  p.constitution = "10"
  p.dexterity = "21"
  p.wisdom = "8"
  p.charisma = "12"
  p.intellect = "8"
  p.save!  
end

(1..5).each do |n|
  s = Spell.new
  s.spell_name = "stab #{n}"
  s.spell_class = "rogue"
  s.spell_info = "stabs stuff"
  s.spell_remaining = "1"
  s.spell_attack = "+10"
  s.spell_damage = "2w"
  s.save!  
end

(1..5).each do |n|
  i = Inventory.new
  i.name = "shiv #{n}"
  i.item_type = "dagger"
  i.info = "stabs stuff"
  i.equipped = "true"
  i.attack = "2w"
  i.dual_wield = "true"
  i.save!  
end

