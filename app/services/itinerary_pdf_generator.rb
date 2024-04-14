require 'prawn'

class ItineraryPdfGenerator
  def self.generate(itinerary)
    Prawn::Document.new do |pdf|
      pdf.text "Itinerary for #{itinerary.traveller_name}", size: 20, style: :bold
      pdf.move_down 10
      pdf.text "Booking Reference: #{itinerary.booking_reference}", size: 12
      pdf.text "Flight Number: #{itinerary.flight_number}", size: 12
      pdf.text "Flight Class: #{itinerary.flight_class}", size: 12
      pdf.text "Departure: #{departure_text(itinerary)}", size: 12
      pdf.text "Arrival: #{arrival_text(itinerary)}", size: 12
      pdf.text "Return Flight Number: #{itinerary.return_flight_number}", size: 12
      pdf.text "Return Departure: #{return_departure_text(itinerary)}", size: 12
      pdf.text "Return Arrival: #{return_arrival_text(itinerary)}", size: 12
      pdf.text "Aircraft: #{itinerary.aircraft}", size: 12
      pdf
    end
  end

  private

  def self.departure_text(itinerary)
    if itinerary.departure_date
      "#{itinerary.departure_city} on #{itinerary.departure_date.strftime('%B %d, %Y at %I:%M %p')}"
    else
      "#{itinerary.departure_city} (Date not specified)"
    end
  end

  def self.arrival_text(itinerary)
    if itinerary.arrival_date
      "#{itinerary.arrival_city} on #{itinerary.arrival_date.strftime('%B %d, %Y at %I:%M %p')}"
    else
      "#{itinerary.arrival_city} (Date not specified)"
    end
  end

  def self.return_departure_text(itinerary)
    if itinerary.return_departure_date
      "#{itinerary.return_departure_city} on #{itinerary.return_departure_date.strftime('%B %d, %Y at %I:%M %p')}"
    else
      "#{itinerary.return_departure_city} (Date not specified)"
    end
  end

  def self.return_arrival_text(itinerary)
    if itinerary.return_arrival_date
      "#{itinerary.return_arrival_city} on #{itinerary.return_arrival_date.strftime('%B %d, %Y at %I:%M %p')}"
    else
      "#{itinerary.return_arrival_city} (Date not specified)"
    end
  end
end
