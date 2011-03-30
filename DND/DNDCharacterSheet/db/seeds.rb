# Seeds player, spell, and inventory.  Defenses and skills will be calculated.  
# Player inventories and player spells not seeded to test functionallity manually.

puts "Destroying all data!"
Player.destroy_all
Spell.destroy_all
Inventory.destroy_all
PlayerInventory.destroy_all
PlayerSpell.destroy_all

(1..10).each do |n|
  p = Player.new
  p.character_name = "Faith #{n}"
  p.character_class = "Rogue"
  p.character_initiative = "#{n}"
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
  s.spell_name = "fireball #{n}"
  s.spell_class = "Mage"
  s.spell_info = "burn stuff"
  s.spell_remaining = "1"
  s.spell_attack = "10"
  s.spell_damage = "12"
  s.spell_weapon = "1"
  s.save!  
end

(1..5).each do |n|
  s = Spell.new
  s.spell_name = "stab #{n}"
  s.spell_class = "Rogue"
  s.spell_info = "stabs stuff"
  s.spell_remaining = "1"
  s.spell_attack = "10"
  s.spell_damage = "5"
  s.spell_weapon = "2"
  s.save!  
end

i = Inventory.new
i.name = "Shiv"
i.item_type = "Weapon"
i.info = "stabs stuff"
i.slot = "1 Handed"
i.damage = "10"
i.save!

i = Inventory.new
i.name = "Fist"
i.item_type = "Weapon"
i.info = "punches stuff"
i.slot = "1 Handed"
i.damage = "4"
i.save!

i = Inventory.new
i.name = "Mace"
i.item_type = "Weapon"
i.info = "slams stuff"
i.slot = "2 Handed"
i.damage = "20"
i.save!

i = Inventory.new
i.name = "Monarch"
i.item_type = "Armor"
i.info = "blocks stuff"
i.slot = "Shield"
i.bAC = "2"
i.bFort = "2"
i.bWill = "2"
i.bReflex = "2"
i.save!

i = Inventory.new
i.name = "Arm"
i.item_type = "Armor"
i.info = ""
i.slot = "Shield"
i.bAC = "10"
i.bFort = "0"
i.bWill = "0"
i.bReflex = "0"
i.save!

i = Inventory.new
i.name = "String"
i.item_type = "Armor"
i.info = ""
i.slot = "Ring"
i.bAC = "0"
i.bFort = "0"
i.bWill = "0"
i.bReflex = "0"
i.save!

i = Inventory.new
i.name = "Hat"
i.item_type = "Armor"
i.info = ""
i.slot = "Helm"
i.bAC = "0"
i.bFort = "0"
i.bWill = "0"
i.bReflex = "0"
i.save!

i = Inventory.new
i.name = "T-Shirt"
i.item_type = "Armor"
i.info = ""
i.slot = "Chest"
i.bAC = "0"
i.bFort = "0"
i.bWill = "0"
i.bReflex = "0"
i.save!

i = Inventory.new
i.name = "Mittens"
i.item_type = "Armor"
i.info = ""
i.slot = "Gloves"
i.bAC = "0"
i.bFort = "0"
i.bWill = "0"
i.bReflex = "0"
i.save!

i = Inventory.new
i.name = "Neck Tie"
i.item_type = "Armor"
i.info = ""
i.slot = "Amulet"
i.bAC = "0"
i.bFort = "0"
i.bWill = "0"
i.bReflex = "0"
i.save!

i = Inventory.new
i.name = "Jeans"
i.item_type = "Armor"
i.info = ""
i.slot = "Legs"
i.bAC = "0"
i.bFort = "0"
i.bWill = "0"
i.bReflex = "0"
i.save!

i = Inventory.new
i.name = "Shoes"
i.item_type = "Armor"
i.info = ""
i.slot = "Boots"
i.bAC = "0"
i.bFort = "0"
i.bWill = "0"
i.bReflex = "0"
i.save!

i = Inventory.new
i.name = "Bloodfist"
i.item_type = "Armor"
i.info = "punches stuff"
i.slot = "Gloves"
i.bAC = "2"
i.bFort = "2"
i.bWill = "2"
i.bReflex = "2"
i.save!

i = Inventory.new
i.name = "Bul'Kathos"
i.item_type = "Armor"
i.info = "ll stuff"
i.slot = "Ring"
i.bAC = "2"
i.bFort = "2"
i.bWill = "2"
i.bReflex = "2"
i.save!

i = Inventory.new
i.name = "Snake skin"
i.item_type = "Armor"
i.info = "covers stuff"
i.slot = "Legs"
i.bAC = "2"
i.bFort = "2"
i.bWill = "2"
i.bReflex = "2"
i.save!

i = Inventory.new
i.name = "Nats soul"
i.item_type = "Armor"
i.info = "kicks stuff"
i.slot = "Boots"
i.bAC = "2"
i.bFort = "2"
i.bWill = "2"
i.bReflex = "2"
i.save!