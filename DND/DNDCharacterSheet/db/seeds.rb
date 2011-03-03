# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts "Destorying all data!"
Player.destroy_all

(1..10).each do |n|
  p = Player.new
  p.character_name = "Faith #{n}"
  p.character_class = "Rogue"
  p.character_initiative = "11"
  p.character_level = "12"
  p.save!  
  
  Stat.create(:player => p, :strength => "11", :constitution => "12", :dexterity => "13", 
              :wisdom => "14", :intellect => "15", :charisma => "16")
end

