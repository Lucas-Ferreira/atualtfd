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

ActiveRecord::Schema[7.0].define(version: 2022_12_27_133022) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "confirmations", force: :cascade do |t|
    t.boolean "present"
    t.bigint "patient_id", null: false
    t.bigint "travel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "present_two"
    t.index ["patient_id"], name: "index_confirmations_on_patient_id"
    t.index ["travel_id"], name: "index_confirmations_on_travel_id"
  end

  create_table "days", force: :cascade do |t|
    t.string "name"
    t.bigint "route_id", null: false
    t.bigint "travel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_days_on_route_id"
    t.index ["travel_id"], name: "index_days_on_travel_id"
  end

  create_table "empenhos", force: :cascade do |t|
    t.float "valor"
    t.string "date"
    t.string "motorista"
    t.bigint "user_id", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["account_id"], name: "index_empenhos_on_account_id"
    t.index ["user_id"], name: "index_empenhos_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "cel"
    t.string "cpf"
    t.string "acompanhante"
    t.string "destino"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "travel_id"
    t.boolean "partida"
    t.boolean "retorno"
    t.string "endereco"
    t.index ["travel_id"], name: "index_patients_on_travel_id"
  end

  create_table "route_vehicles", force: :cascade do |t|
    t.bigint "route_id", null: false
    t.bigint "vehicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_route_vehicles_on_route_id"
    t.index ["vehicle_id"], name: "index_route_vehicles_on_vehicle_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "origem"
    t.string "destino"
    t.string "especialidade"
    t.string "capacidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
  end

  create_table "saldos", force: :cascade do |t|
    t.float "saldo_total"
    t.float "aporte_total"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_saldos_on_user_id"
  end

  create_table "travel_vehicles", force: :cascade do |t|
    t.bigint "travel_id", null: false
    t.bigint "vehicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["travel_id"], name: "index_travel_vehicles_on_travel_id"
    t.index ["vehicle_id"], name: "index_travel_vehicles_on_vehicle_id"
  end

  create_table "travels", force: :cascade do |t|
    t.string "status"
    t.string "hr_partida"
    t.string "hr_volta"
    t.string "hr_final"
    t.bigint "route_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.integer "user_id"
    t.integer "month"
    t.index ["route_id"], name: "index_travels_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "role"
    t.integer "account_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "modelo"
    t.string "placa"
    t.string "capacidade"
    t.string "ano"
    t.string "montadora"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  add_foreign_key "confirmations", "patients"
  add_foreign_key "confirmations", "travels"
  add_foreign_key "days", "routes"
  add_foreign_key "days", "travels"
  add_foreign_key "empenhos", "accounts"
  add_foreign_key "empenhos", "users"
  add_foreign_key "route_vehicles", "routes"
  add_foreign_key "route_vehicles", "vehicles"
  add_foreign_key "saldos", "users"
  add_foreign_key "travel_vehicles", "travels"
  add_foreign_key "travel_vehicles", "vehicles"
  add_foreign_key "travels", "routes"
  add_foreign_key "vehicles", "users"
end
