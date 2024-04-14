class Itinerary < ApplicationRecord
    has_many :flights
    has_many :departure_flights, -> { where(flight_type: 'departure') }, class_name: 'Flight'
    has_many :return_flights, -> { where(flight_type: 'return') }, class_name: 'Flight'
end