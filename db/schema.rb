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

ActiveRecord::Schema[7.1].define(version: 2024_04_14_133047) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flights", force: :cascade do |t|
    t.bigint "itinerary_id"
    t.string "flight_number"
    t.string "departure_city"
    t.datetime "departure_date"
    t.string "arrival_city"
    t.datetime "arrival_date"
    t.string "flight_class"
    t.string "aircraft"
    t.string "flight_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "seat_number"
    t.string "cabin_bag"
    t.string "checked_bags"
    t.index ["itinerary_id"], name: "index_flights_on_itinerary_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "traveller_name"
    t.string "booking_reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  add_foreign_key "flights", "itineraries"
end
