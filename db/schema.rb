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

ActiveRecord::Schema[8.0].define(version: 2025_06_10_135423) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "attendance_records", force: :cascade do |t|
    t.bigint "attendance_id", null: false
    t.string "attendee_type", null: false
    t.bigint "attendee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendance_id"], name: "index_attendance_records_on_attendance_id"
    t.index ["attendee_type", "attendee_id"], name: "index_attendance_records_on_attendee"
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "sport_schedule_id", null: false
    t.date "attended_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_schedule_id"], name: "index_attendances_on_sport_schedule_id"
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "coach_payments", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.decimal "amount"
    t.date "paid_on"
    t.string "concept"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_coach_payments_on_coach_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "name"
    t.datetime "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "sport_schedule_id", null: false
    t.string "enrollment_type"
    t.decimal "price_per_period"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_schedule_id"], name: "index_enrollments_on_sport_schedule_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "concept"
    t.decimal "amount"
    t.date "paid_on"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sport_schedules", force: :cascade do |t|
    t.bigint "sport_id", null: false
    t.integer "day_of_week"
    t.time "start_time"
    t.time "end_time"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_sport_schedules_on_sport_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_payments", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.decimal "amount"
    t.string "payment_type"
    t.date "paid_on"
    t.string "reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_payments_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.datetime "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendance_records", "attendances"
  add_foreign_key "attendances", "sport_schedules"
  add_foreign_key "coach_payments", "coaches"
  add_foreign_key "enrollments", "sport_schedules"
  add_foreign_key "enrollments", "students"
  add_foreign_key "sport_schedules", "sports"
  add_foreign_key "student_payments", "students"
end
