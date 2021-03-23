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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_23_012352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.boolean "first_aid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.boolean "permit_required"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.integer "num_of_participants"
    t.boolean "virtual"
    t.bigint "park_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["park_id"], name: "index_programs_on_park_id"
  end

  create_table "trails", force: :cascade do |t|
    t.string "name"
    t.integer "elevation"
    t.boolean "dogs_allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "office_id"
    t.index ["office_id"], name: "index_trails_on_office_id"
  end

  add_foreign_key "programs", "parks"
  add_foreign_key "trails", "offices"
end
