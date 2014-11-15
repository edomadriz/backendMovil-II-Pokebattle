# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20141111195823) do

  create_table "battle_records", :force => true do |t|
    t.integer  "user_id"
    t.integer  "result"
    t.integer  "pokemon"
    t.datetime "date"
    t.integer  "experience"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "battle_records", ["user_id"], :name => "index_battle_records_on_user_id"

  create_table "pokedexes", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pokedexes", ["user_id"], :name => "index_pokedexes_on_user_id"

  create_table "pokemon_pokedexes", :force => true do |t|
    t.integer  "pokedex_id"
    t.integer  "pokemon_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pokemon_pokedexes", ["pokedex_id"], :name => "index_pokemon_pokedexes_on_pokedex_id"
  add_index "pokemon_pokedexes", ["pokemon_id"], :name => "index_pokemon_pokedexes_on_pokemon_id"

  create_table "pokemons", :force => true do |t|
    t.string   "name"
    t.integer  "base_hp"
    t.string   "base_type"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "pokedex_number"
    t.string   "attack"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "experience"
    t.integer  "base_pokemon"
    t.integer  "id_twitter"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
