require 'prawn'
require 'prawn/table'

class ItineraryPdfGenerator
  def self.generate(itinerary)
    Prawn::Document.new(margin: 50) do |pdf|
      pdf.font "Helvetica"

      # Title
      pdf.text "Flight Itinerary", size: 18, style: :bold, align: :center
      pdf.move_down 20

      # Passenger Information
      pdf.text "PASSENGER INFORMATION", size: 14, style: :bold
      pdf.stroke_horizontal_rule
      pdf.move_down 10
      pdf.text "Name of Traveller\n#{itinerary.traveller_name}", size: 12
      pdf.move_down 20

      # Departure Information
      pdf.text "DEPARTURE INFORMATION", size: 14, style: :bold
      pdf.stroke_horizontal_rule
      pdf.move_down 10
      departure_data = [
        ["Departure\n#{itinerary.departure_city}", "Arrival\n#{itinerary.arrival_city}"],
        ["Departure Date\n#{format_date(itinerary.departure_date)}", "Arrival Date\n#{format_date(itinerary.arrival_date)}"],
        ["Aircraft\n#{itinerary.aircraft}", "Class\n#{itinerary.flight_class}"],
        ["Flight No.\n#{itinerary.flight_number}", "Booking Reference\n#{itinerary.booking_reference}"]
      ]
      pdf.table(departure_data, cell_style: { borders: [] })
      pdf.move_down 20

      # Return Flight Information
      pdf.text "RETURN INFORMATION", size: 14, style: :bold
      pdf.stroke_horizontal_rule
      pdf.move_down 10
      return_data = [
        ["Departure\n#{itinerary.return_departure_city}", "Arrival\n#{itinerary.return_arrival_city}"],
        ["Departure Date\n#{format_date(itinerary.return_departure_date)}", "Arrival Date\n#{format_date(itinerary.return_arrival_date)}"],
        ["Aircraft\n#{itinerary.aircraft}", "Class\n#{itinerary.flight_class}"],
        ["Flight No.\n#{itinerary.return_flight_number}", "Booking Reference\n#{itinerary.booking_reference}"]
      ]
      pdf.table(return_data, cell_style: { borders: [] })
      pdf.move_down 20

      # Footer
      pdf.number_pages "<page> of <total>", at: [pdf.bounds.right - 50, 0]
    end
  end

  def self.format_date(date)
    date.strftime('%A, %B %d, %Y %H:%M') rescue 'Date not specified'
  end
end
