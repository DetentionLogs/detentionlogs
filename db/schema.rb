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

ActiveRecord::Schema.define(:version => 20140502105030) do

  create_table "admins", :force => true do |t|
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
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "foi_requests", :force => true do |t|
    t.integer  "incident_id"
    t.string   "described_state"
    t.string   "display_status"
    t.string   "url_title"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "foi_requests", ["incident_id"], :name => "index_foi_requests_on_incident_id"
  add_index "foi_requests", ["url_title"], :name => "index_foi_requests_on_url_title", :unique => true

  create_table "incidents", :force => true do |t|
    t.string   "incident_number"
    t.string   "incident_type"
    t.string   "level"
    t.string   "location"
    t.text     "location_details"
    t.text     "summary"
    t.datetime "occured_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "informed_by"
    t.datetime "informed_on"
    t.string   "detailed_report_file_name"
    t.string   "detailed_report_content_type"
    t.integer  "detailed_report_file_size"
    t.datetime "detailed_report_updated_at"
    t.integer  "location_id"
  end

  add_index "incidents", ["location", "occured_on", "incident_type"], :name => "index_incidents_on_location_and_occured_on_and_incident_type"

  create_table "location_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "geoloc"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.text     "description"
    t.integer  "location_group_id"
  end

  create_table "population_records", :force => true do |t|
    t.date     "date"
    t.integer  "men"
    t.integer  "women"
    t.integer  "children"
    t.integer  "total"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
