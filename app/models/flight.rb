class Flight < ApplicationRecord
    belongs_to :itinerary
  
    scope :departures, -> { where(flight_type: 'departure') }
    scope :returns, -> { where(flight_type: 'return') }
end