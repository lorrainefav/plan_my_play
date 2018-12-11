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

ActiveRecord::Schema.define(version: 2018_12_11_170025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.datetime "begin_at"
    t.datetime "end_at"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_availabilities_on_user_id"
  end

  create_table "convocations", force: :cascade do |t|
    t.bigint "match_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "registration_id"
    t.index ["match_id"], name: "index_convocations_on_match_id"
    t.index ["registration_id"], name: "index_convocations_on_registration_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "tournament_id"
    t.datetime "begin_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "court"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tournament_id"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "registration_ranking"
    t.string "ranking"
    t.string "phone_number"
    t.string "gender"
    t.string "club"
    t.index ["tournament_id"], name: "index_registrations_on_tournament_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "courts_number"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.bigint "supervisor_id"
    t.integer "match_duration", default: 90
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["supervisor_id"], name: "index_tournaments_on_supervisor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "supervisor"
    t.string "last_name"
    t.string "first_name"
    t.string "licence"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "availabilities", "users"
  add_foreign_key "convocations", "matches"
  add_foreign_key "convocations", "registrations"
  add_foreign_key "matches", "tournaments"
  add_foreign_key "registrations", "tournaments"
  add_foreign_key "registrations", "users"
  add_foreign_key "tournaments", "users", column: "supervisor_id"
end
