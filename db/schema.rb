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

ActiveRecord::Schema.define(version: 20171218025624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "care_managers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_care_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_care_managers_on_reset_password_token", unique: true
  end

  create_table "message_threads", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_message_threads_on_patient_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "message_thread_id", null: false
    t.integer "creator_id", null: false
    t.text "message_text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_messages_on_creator_id"
    t.index ["message_thread_id"], name: "index_messages_on_message_thread_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true
  end

  create_table "patients_care_managers", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "care_manager_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["care_manager_id"], name: "index_patients_care_managers_on_care_manager_id"
    t.index ["patient_id"], name: "index_patients_care_managers_on_patient_id"
  end

  create_table "read_messages", force: :cascade do |t|
    t.integer "message_id", null: false
    t.integer "user_id", null: false
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_read_messages_on_message_id"
    t.index ["user_id"], name: "index_read_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "identifiable_type"
    t.bigint "identifiable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifiable_type", "identifiable_id"], name: "index_users_on_identifiable_type_and_identifiable_id"
  end

end
