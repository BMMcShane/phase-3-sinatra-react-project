# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_30_173242) do

  create_table "farmers", force: :cascade do |t|
    t.integer "coins"
    t.datetime "date"
    t.string "username"
    t.string "password"
    t.string "plants"
  end

  create_table "farms", force: :cascade do |t|
    t.integer "farmer_id"
  end

  create_table "plant_lists", force: :cascade do |t|
    t.integer "farmer_id"
    t.string "unlocked_plants"
    t.string "locked_plants"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.string "plant_type"
    t.integer "price"
    t.integer "rarity"
    t.string "description"
    t.integer "plot_location"
    t.integer "time_planted"
    t.integer "farm_id"
  end

  create_table "upgrades", force: :cascade do |t|
    t.integer "farmer_id"
    t.integer "farm_id"
    t.integer "farm_upgrade_level"
    t.integer "farmer_upgrade_level"
  end

end
