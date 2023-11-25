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

ActiveRecord::Schema[7.0].define(version: 2023_11_24_065749) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avatars", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "avatar_name", null: false
    t.integer "experience_point", null: false
    t.string "avatar_image_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_avatars_on_user_id"
  end

  create_table "choices", force: :cascade do |t|
    t.bigint "quiz_id", null: false
    t.text "text", null: false
    t.boolean "correct", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_choices_on_quiz_id"
  end

  create_table "quiz_sets", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "quiz_set_id", null: false
    t.text "question", null: false
    t.integer "drug_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "explanation", null: false
    t.index ["quiz_set_id"], name: "index_quizzes_on_quiz_set_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "quiz_set_id", null: false
    t.integer "correct_answer", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_set_id"], name: "index_scores_on_quiz_set_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "avatars", "users"
  add_foreign_key "choices", "quizzes"
  add_foreign_key "quizzes", "quiz_sets"
  add_foreign_key "scores", "quiz_sets"
  add_foreign_key "scores", "users"
end
