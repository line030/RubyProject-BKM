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

ActiveRecord::Schema.define(:version => 20120517221310) do

  create_table "aims", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
    t.integer  "value"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "unit_id"
  end

  create_table "exercises", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picture"
    t.integer  "points"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "unit_id"
  end

  create_table "exercises_workout_days", :id => false, :force => true do |t|
    t.integer "exercise_id"
    t.integer "workout_day_id"
  end

  create_table "exercises_workout_thrills", :force => true do |t|
    t.integer "exercise_id"
    t.integer "workout_session_id"
    t.integer "value"
    t.integer "multiplier"
  end

  create_table "units", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "workout_days", :force => true do |t|
    t.string   "day"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "workout_plan_id"
  end

  create_table "workout_plans", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "workout_sessions", :force => true do |t|
    t.datetime "date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "workout_day_id"
  end

end
