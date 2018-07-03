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

ActiveRecord::Schema.define(version: 2018_07_03_143110) do

  create_table "achievements", force: :cascade do |t|
    t.integer "activity_id"
    t.integer "user_id"
    t.boolean "is_private", default: false
    t.string "title"
    t.text "content"
    t.integer "mentorship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activities", force: :cascade do |t|
    t.integer "bracket_id"
    t.string "title"
    t.text "description"
    t.text "build_array", default: "[[\"text_area\", \"content\"]]"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brackets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "achievement_id"
    t.integer "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentorships", force: :cascade do |t|
    t.string "title"
    t.boolean "is_complete", default: false
    t.date "end_date"
    t.integer "bracket_id"
    t.string "teacher_type", default: "User"
    t.integer "teacher_id"
    t.string "student_type", default: "User"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level"
    t.string "level_name"
    t.index ["student_type", "student_id"], name: "index_mentorships_on_student_type_and_student_id"
    t.index ["teacher_type", "teacher_id"], name: "index_mentorships_on_teacher_type_and_teacher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "displayname"
    t.boolean "is_admin", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
