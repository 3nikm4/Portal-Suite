# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120626152625) do

  create_table "access_groups", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "access_levels", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "audits", :force => true do |t|
    t.integer  "user_id"
    t.integer  "device_id"
    t.string   "action"
    t.string   "webpage"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "call_locations", :force => true do |t|
    t.string   "call_location"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "call_types", :force => true do |t|
    t.string   "call_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "calls", :force => true do |t|
    t.integer  "user_id"
    t.datetime "call_start"
    t.datetime "call_end"
    t.string   "call_reason"
    t.string   "call_notes"
    t.integer  "call_location_id"
    t.boolean  "call_direction"
    t.integer  "contact_id"
    t.integer  "contact_type_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "call_type_id"
  end

  create_table "contact_types", :force => true do |t|
    t.string   "contact_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "contact_type_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.date     "dob"
    t.string   "device_serial"
  end

  create_table "device_assignments", :force => true do |t|
    t.integer  "device_id"
    t.integer  "patient_id"
    t.integer  "location_id"
    t.date     "start_date"
    t.date     "end_date"
    t.date     "returned_date"
    t.integer  "monitor_length"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "device_batteries", :force => true do |t|
    t.integer  "device_id"
    t.string   "device_battery_serial"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "device_carriers", :force => true do |t|
    t.string   "device_carrier"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "device_locations", :force => true do |t|
    t.integer  "location_id"
    t.integer  "device_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "active"
    t.date     "arrival_date"
    t.date     "depart_date"
  end

  create_table "device_problem_statuses", :force => true do |t|
    t.string   "device_problem_status"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "device_problems", :force => true do |t|
    t.integer  "device_id"
    t.string   "device_problem"
    t.text     "comment"
    t.integer  "device_problem_status_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "device_statuses", :force => true do |t|
    t.string   "device_status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "device_tests", :force => true do |t|
    t.integer  "device_id"
    t.boolean  "tom24"
    t.boolean  "forced"
    t.boolean  "enrolled"
    t.boolean  "completed"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "device_types", :force => true do |t|
    t.string   "device_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "devices", :force => true do |t|
    t.integer  "device_status_id"
    t.integer  "device_type_id"
    t.string   "serial_number"
    t.string   "asset_tag"
    t.text     "comment"
    t.string   "imsi"
    t.string   "iccid"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "device_carrier_id"
  end

  create_table "disposable_types", :force => true do |t|
    t.string   "disposable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "disposables", :force => true do |t|
    t.integer  "disposable_type_id"
    t.integer  "location_id"
    t.integer  "amount"
    t.integer  "par_level"
    t.integer  "alert_amount"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "group_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "location_alert_contacts", :id => false, :force => true do |t|
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "location_types", :force => true do |t|
    t.string   "location_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "locations", :force => true do |t|
    t.integer  "practice_id"
    t.integer  "location_type_id"
    t.string   "location_name"
    t.string   "location_street1"
    t.string   "location_street2"
    t.string   "location_city"
    t.string   "location_state"
    t.string   "location_zip"
    t.string   "location_contact"
    t.integer  "par_level_event"
    t.integer  "par_level_mct"
    t.integer  "alert_amount"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.boolean  "active"
    t.integer  "par_level_scottcare"
  end

  create_table "patient_assignments", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "device_id"
    t.date     "monitor_start"
    t.date     "monitor_end"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.date     "returned_date"
    t.boolean  "active"
  end

  create_table "patients", :force => true do |t|
    t.integer  "location_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_street1"
    t.string   "address_street2"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_zip"
    t.date     "dob"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "active"
  end

  create_table "practices", :force => true do |t|
    t.string   "practice_name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "reports", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_locations", :force => true do |t|
    t.string   "location_name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "group_id"
    t.boolean  "active"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
