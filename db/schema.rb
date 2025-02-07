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

ActiveRecord::Schema.define(version: 2022_10_05_203605) do

  create_table "farmers", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.integer "coins", default: 100
    t.string "unlocked_plants"
    t.string "locked_plants"
    t.boolean "logged_in"
  end

  create_table "farms", force: :cascade do |t|
    t.integer "farmer_id"
    t.integer "farm_upgrade_level"
    t.integer "farmer_upgrade_level"
  end

  create_table "planted_plants", force: :cascade do |t|
    t.integer "plot_location"
    t.datetime "time_planted"
    t.integer "farm_id"
    t.integer "plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "description"
  end

end
