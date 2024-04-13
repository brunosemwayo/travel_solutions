class CreateItineraries < ActiveRecord::Migration[7.1]
  def change
    create_table :itineraries do |t|
      t.string :traveller_name
      t.string :booking_reference
      t.string :flight_number
      t.string :flight_class
      t.string :departure_city
      t.datetime :departure_date
      t.string :arrival_city
      t.datetime :arrival_date
      t.string :aircraft
      t.string :return_flight_number
      t.string :return_departure_city
      t.datetime :return_departure_date
      t.string :return_arrival_city
      t.datetime :return_arrival_date

      t.timestamps
    end
  end
end
