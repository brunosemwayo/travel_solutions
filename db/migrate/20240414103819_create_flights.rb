class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.references :itinerary, foreign_key: true
      t.string :flight_number
      t.string :departure_city
      t.datetime :departure_date
      t.string :arrival_city
      t.datetime :arrival_date
      t.string :flight_class
      t.string :aircraft
      t.string :flight_type # 'departure' or 'return'
      
      t.timestamps
    end
  end
end
