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

ActiveRecord::Schema[7.0].define(version: 2023_04_16_031746) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auction_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "card_id", null: false
    t.uuid "card_condition_id", null: false
    t.float "current_price", null: false
    t.float "minimum_bid", null: false
    t.datetime "end_date", precision: nil, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_condition_id"], name: "index_auction_items_on_card_condition_id"
    t.index ["card_id"], name: "index_auction_items_on_card_id"
  end

  create_table "card_conditions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_rarities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "number", null: false
    t.string "name", null: false
    t.string "image_url", null: false
    t.uuid "card_type_id", null: false
    t.uuid "card_rarity_id", null: false
    t.uuid "serie_set_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_rarity_id"], name: "index_cards_on_card_rarity_id"
    t.index ["card_type_id"], name: "index_cards_on_card_type_id"
    t.index ["serie_set_id"], name: "index_cards_on_serie_set_id"
  end

  create_table "serie_sets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.date "release_date", null: false
    t.uuid "serie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_amount", default: 0, null: false
    t.index ["serie_id"], name: "index_serie_sets_on_serie_id"
  end

  create_table "series", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.date "release_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "auction_items", "card_conditions"
  add_foreign_key "auction_items", "cards"
  add_foreign_key "cards", "card_rarities"
  add_foreign_key "cards", "card_types"
  add_foreign_key "cards", "serie_sets"
  add_foreign_key "serie_sets", "series", column: "serie_id"
end
