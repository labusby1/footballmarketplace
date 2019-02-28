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

ActiveRecord::Schema.define(version: 2019_02_28_154619) do

  create_table "beings", force: :cascade do |t|
    t.string "family"
    t.boolean "can_be_owned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buyers", force: :cascade do |t|
    t.integer "portfolio_id"
    t.float "purchase_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "founded"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "possession_id"
  end

  create_table "clubs_leagues", id: false, force: :cascade do |t|
    t.integer "league_id"
    t.integer "club_id"
    t.index ["club_id"], name: "index_clubs_leagues_on_club_id"
    t.index ["league_id"], name: "index_clubs_leagues_on_league_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "being_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "name"
    t.string "nationality"
    t.string "dob"
    t.integer "club_id"
    t.integer "possession_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "onthemarkets", force: :cascade do |t|
    t.boolean "buying"
    t.integer "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "stocks_on_market"
    t.integer "ideal_number_sold"
    t.integer "least_possible"
    t.float "price_per"
    t.integer "max_number_sold"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "nationality"
    t.string "dob"
    t.integer "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "possession_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.float "balance"
    t.float "net_worth"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "favorite_team"
  end

  create_table "possessions", force: :cascade do |t|
    t.integer "being_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sellers", force: :cascade do |t|
    t.integer "portfolio_id"
    t.float "retail_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "stock_name"
    t.string "symbol"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "portfolio_id"
    t.integer "possession_id"
    t.integer "being_id"
  end

  create_table "stocks_transactors", id: false, force: :cascade do |t|
    t.integer "transactor_id"
    t.integer "stock_id"
    t.index ["stock_id"], name: "index_stocks_transactors_on_stock_id"
    t.index ["transactor_id"], name: "index_stocks_transactors_on_transactor_id"
  end

  create_table "transactors", force: :cascade do |t|
    t.integer "buyer_id"
    t.integer "seller_id"
    t.float "transaction_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "moveable"
    t.text "stocks_to_move"
    t.integer "otm_id"
    t.string "stock_symbol"
    t.datetime "sold_on"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
