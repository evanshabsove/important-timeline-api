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

ActiveRecord::Schema.define(version: 20191017110307) do

  create_table "matches", force: :cascade do |t|
    t.integer "user_id"
    t.integer "matched_with_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matched_with_user_id"], name: "index_matches_on_matched_with_user_id"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.date "date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "given_name"
    t.string "family_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
  end

end
