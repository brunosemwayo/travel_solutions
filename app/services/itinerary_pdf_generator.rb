require 'prawn'
require 'prawn/table'

class ItineraryPdfGenerator
  def self.generate(itinerary)
    Prawn::Document.new(margin: [0, 40, 40, 40]) do |pdf|
      pdf.font "Helvetica"

      # Logo placement at the top left corner within the margins
      logo_path = Rails.root.join('travel_logo.jpg')  # Absolute path to the logo
      pdf.image logo_path.to_s, at: [pdf.bounds.left, pdf.bounds.top], width: 150
      pdf.move_down 60  # Move down by the height of the image plus some extra space

      # Title
      pdf.text "Flight Itinerary", size: 18, style: :bold, align: :center
      pdf.move_down 20

      # Passenger Information
      pdf.text "PASSENGER INFORMATION", size: 12, style: :bold, align: :left
      pdf.stroke_horizontal_rule
      pdf.move_down 5
      pdf.text "Name of Traveller: <color rgb='000000'>#{itinerary.traveller_name}</color>", inline_format: true, size: 11
      pdf.text "Booking Reference: <color rgb='000000'>#{itinerary.booking_reference}</color>", inline_format: true, size: 11
      pdf.move_down 10

      # Departure Information
      pdf.text "DEPARTURE INFORMATION", size: 12, style: :bold, align: :left
      pdf.stroke_horizontal_rule
      pdf.move_down 5
      itinerary.departure_flights.each do |flight|
        create_info_table(pdf, [
          ["Departure", flight.departure_city, "Arrival", flight.arrival_city],
          ["Departure Date", format_date(flight.departure_date), "Arrival Date", format_date(flight.arrival_date)],
          ["Aircraft", flight.aircraft, "Class", flight.flight_class],
          ["Flight No.", flight.flight_number, "Seat No", flight.seat_number]
        ])
        pdf.move_down 10
      end

      # Return Flight Information
      pdf.text "RETURN INFORMATION", size: 12, style: :bold, align: :left
      pdf.stroke_horizontal_rule
      pdf.move_down 5
      itinerary.return_flights.each do |flight|
        create_info_table(pdf, [
          ["Departure", flight.departure_city, "Arrival", flight.arrival_city],
          ["Departure Date", format_date(flight.departure_date), "Arrival Date", format_date(flight.arrival_date)],
          ["Aircraft", flight.aircraft, "Class", flight.flight_class],
          ["Flight No.", flight.flight_number, "Seat No", flight.seat_number]
        ])
        pdf.move_down 10
      end

      # Footer
      pdf.number_pages "Page <page> of <total>", at: [pdf.bounds.right - 50, 0]
    end
  end

  def self.create_info_table(pdf, data)
    pdf.table(data, cell_style: { borders: [], padding: [3, 5, 3, 5], inline_format: true }, column_widths: [70, 180, 70, 180]) do
      rows(0..-1).columns(0).style(font_style: :bold, background_color: 'DEEBFF')
      rows(0..-1).columns(2).style(font_style: :bold, background_color: 'DEEBFF')
      rows(0..-1).columns(1).style(background_color: 'FFFFFF')
      rows(0..-1).columns(3).style(background_color: 'FFFFFF')
    end
  end

  def self.format_date(date)
    date.strftime('%A, %B %d, %Y %H:%M') rescue 'Date not specified'
  end
end
