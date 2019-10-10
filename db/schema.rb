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

ActiveRecord::Schema.define(version: 2019_10_01_175158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "env_measurements", force: :cascade do |t|
    t.float "soil_temperature"
    t.float "soil_moisture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "garden_id"
    t.index ["garden_id"], name: "index_env_measurements_on_garden_id"
  end

  create_table "gardens", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "max_moisture"
    t.float "min_moisture"
    t.boolean "auto_water", default: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_gardens_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "garden_id"
    t.index ["garden_id"], name: "index_jobs_on_garden_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "url"
    t.bigint "garden_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_id"], name: "index_photos_on_garden_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "api_key"
    t.boolean "api_key_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "photos", "gardens"
end
