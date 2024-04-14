class RemoveFieldsFromItineraries < ActiveRecord::Migration[7.1]
  def change
    remove_column :itineraries, :flight_number, :string
    remove_column :itineraries, :departure_city, :string
    remove_column :itineraries, :departure_date, :datetime
    remove_column :itineraries, :arrival_city, :string
    remove_column :itineraries, :arrival_date, :datetime
    remove_column :itineraries, :aircraft, :string
    remove_column :itineraries, :flight_class, :string
    remove_column :itineraries, :return_flight_number, :string
    remove_column :itineraries, :return_departure_city, :string
    remove_column :itineraries, :return_departure_date, :datetime
    remove_column :itineraries, :return_arrival_city, :string
    remove_column :itineraries, :return_arrival_date, :datetime
  end
end