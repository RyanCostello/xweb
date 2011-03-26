# Seeds player, spell, and inventory.  Defenses and skills will be calculated.  
# Player inventories and player spells not seeded to test functionallity manually.

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
  s.spell_attack = "10"
  s.spell_damage = "2"
  s.save!  
end

(1..5).each do |n|
  i = Inventory.new
  i.name = "shiv #{n}"
  i.item_type = "weapon"
  i.info = "stabs stuff"
  i.slot = "1h"
  i.damage = "10"
  i.save!
end

(1..5).each do |n|
  i = Inventory.new
  i.name = "hat #{n}"
  i.item_type = "armor"
  i.info = "stabs stuff"
  i.slot = "helm"
  i.bAC = "1"
  i.bFort = "2"
  i.bWill = "3"
  i.bReflex = "4"
  i.save!
end