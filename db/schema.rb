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

ActiveRecord::Schema.define(version: 20171005162139) do

  create_table "break_causes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "breaks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "expense_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "break_cause_id"
    t.bigint "damage_id"
    t.index ["break_cause_id"], name: "index_breaks_on_break_cause_id"
    t.index ["damage_id"], name: "index_breaks_on_damage_id"
    t.index ["expense_id"], name: "index_breaks_on_expense_id"
  end

  create_table "cab_models", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.date "manufacture_year"
    t.bigint "fuel_type_id"
    t.string "sheet_metal"
    t.integer "power_hp"
    t.integer "number_places"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fuel_type_id"], name: "index_cab_models_on_fuel_type_id"
  end

  create_table "cabs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "cab_model_id"
    t.string "license_plate"
    t.string "agreement_number"
    t.decimal "total_mileage", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "manager_id"
    t.index ["cab_model_id"], name: "index_cabs_on_cab_model_id"
    t.index ["manager_id"], name: "index_cabs_on_manager_id"
  end

  create_table "damage_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "damages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "damage_type_id"
    t.bigint "expense_id"
    t.bigint "driver_id"
    t.date "date"
    t.float "kilometers", limit: 24
    t.integer "labor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["damage_type_id"], name: "index_damages_on_damage_type_id"
    t.index ["driver_id"], name: "index_damages_on_driver_id"
    t.index ["expense_id"], name: "index_damages_on_expense_id"
  end

  create_table "drivers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "full_name"
    t.date "birth_date"
    t.bigint "mobile_phone"
    t.bigint "home_phone"
    t.string "driving_license_number"
    t.string "home_address"
    t.string "cin"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cab_id"
    t.index ["cab_id"], name: "index_drivers_on_cab_id"
  end

  create_table "expenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "amount"
    t.string "attached_file"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fuel_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "amount"
    t.string "attached_file"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insurance_take_backs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "income_id"
    t.bigint "insurance_id"
    t.index ["income_id"], name: "index_insurance_take_backs_on_income_id"
    t.index ["insurance_id"], name: "index_insurance_take_backs_on_insurance_id"
  end

  create_table "insurances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "expense_id"
    t.bigint "insurer_id"
    t.date "start_date"
    t.date "expiration_date"
    t.string "police_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_insurances_on_expense_id"
    t.index ["insurer_id"], name: "index_insurances_on_insurer_id"
  end

  create_table "insurers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "picture"
    t.string "address"
    t.bigint "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manager_takes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "income_id"
    t.bigint "manager_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["income_id"], name: "index_manager_takes_on_income_id"
    t.index ["manager_id"], name: "index_manager_takes_on_manager_id"
  end

  create_table "managers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.string "full_name"
    t.string "picture"
    t.bigint "home_phone"
    t.bigint "mobile_phone"
    t.date "birth_date"
    t.string "cin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
  end

  create_table "owner_takes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "expense_id"
    t.bigint "owner_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_owner_takes_on_expense_id"
    t.index ["owner_id"], name: "index_owner_takes_on_owner_id"
  end

  create_table "owners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "full_name"
    t.bigint "home_phone"
    t.bigint "mobile_phone"
    t.string "cin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "breaks", "break_causes"
  add_foreign_key "breaks", "damages"
  add_foreign_key "breaks", "expenses"
  add_foreign_key "cab_models", "fuel_types"
  add_foreign_key "cabs", "cab_models"
  add_foreign_key "cabs", "managers"
  add_foreign_key "damages", "damage_types"
  add_foreign_key "damages", "drivers"
  add_foreign_key "damages", "expenses"
  add_foreign_key "drivers", "cabs"
  add_foreign_key "insurance_take_backs", "incomes"
  add_foreign_key "insurance_take_backs", "insurances"
  add_foreign_key "manager_takes", "incomes"
  add_foreign_key "manager_takes", "managers"
  add_foreign_key "owner_takes", "expenses"
  add_foreign_key "owner_takes", "owners"
end
