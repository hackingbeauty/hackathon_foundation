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

ActiveRecord::Schema.define(:version => 20111214070614) do

  create_table "coordinates", :force => true do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.integer  "type_id"
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "connection_type"
    t.integer  "coordinate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "info"
  end

  add_index "users", ["phone"], :name => "index_users_on_phone"

  create_table "visits", :force => true do |t|
    t.integer  "user_id"
    t.integer  "coordinate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visits", ["coordinate_id"], :name => "index_visits_on_coordinate_id"
  add_index "visits", ["user_id", "coordinate_id"], :name => "index_visits_on_user_id_and_coordinate_id", :unique => true
  add_index "visits", ["user_id"], :name => "index_visits_on_user_id"

end
