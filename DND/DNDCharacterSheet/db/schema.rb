# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110310192443) do

  create_table "defenses", :force => true do |t|
    t.integer  "AC"
    t.integer  "Fort"
    t.integer  "Reflex"
    t.integer  "Will"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", :force => true do |t|
    t.string   "item_type"
    t.string   "slot"
    t.string   "name"
    t.string   "info"
    t.integer  "damage"
    t.integer  "bAC"
    t.integer  "bFort"
    t.integer  "bWill"
    t.integer  "bReflex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_inventories", :force => true do |t|
    t.integer  "player_id"
    t.integer  "inventory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_spells", :force => true do |t|
    t.integer  "player_id"
    t.integer  "spell_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "character_name"
    t.string   "character_class"
    t.integer  "character_initiative"
    t.integer  "character_level"
    t.integer  "strength"
    t.integer  "constitution"
    t.integer  "dexterity"
    t.integer  "intellect"
    t.integer  "wisdom"
    t.integer  "charisma"
    t.integer  "health"
    t.integer  "health_per_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", :force => true do |t|
    t.integer  "Acrobatics"
    t.integer  "Arcana"
    t.integer  "Athletics"
    t.integer  "Bluff"
    t.integer  "Diplomacy"
    t.integer  "Dungeoneering"
    t.integer  "Endurance"
    t.integer  "Heal"
    t.integer  "History"
    t.integer  "Insight"
    t.integer  "Intimidate"
    t.integer  "Nature"
    t.integer  "Perception"
    t.integer  "Religion"
    t.integer  "Stealth"
    t.integer  "Streetwise"
    t.integer  "Thievery"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spells", :force => true do |t|
    t.string   "spell_name"
    t.string   "spell_class"
    t.string   "spell_info"
    t.integer  "spell_remaining"
    t.integer  "spell_attack"
    t.integer  "spell_weapon"
    t.integer  "spell_damage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
