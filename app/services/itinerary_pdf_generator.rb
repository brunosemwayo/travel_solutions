require 'prawn'
require 'prawn/table'

class ItineraryPdfGenerator
  def self.generate(itinerary)
    Prawn::Document.new(margin: 40) do |pdf|
      pdf.font "Helvetica"

      # Title
      pdf.move_down 10
      pdf.text "Flight Itinerary", size: 18, style: :bold, align: :center
      pdf.move_down 20

      # Passenger Information
      pdf.text "PASSENGER INFORMATION", size: 12, style: :bold, align: :left
      pdf.stroke_horizontal_rule
      pdf.move_down 5
      pdf.text "Name of Traveller: <color rgb='000000'>#{itinerary.traveller_name}</color>", inline_format: true, size: 11
      pdf.move_down 10

      # Departure Information
      pdf.text "DEPARTURE INFORMATION", size: 12, style: :bold, align: :left
      pdf.stroke_horizontal_rule
      pdf.move_down 5
      create_info_table(pdf, [
        ["Departure", itinerary.departure_city, "Arrival", itinerary.arrival_city],
        ["Departure Date", format_date(itinerary.departure_date), "Arrival Date", format_date(itinerary.arrival_date)],
        ["Aircraft", itinerary.aircraft, "Class", itinerary.flight_class],
        ["Flight No.", itinerary.flight_number, "Booking Reference", itinerary.booking_reference]
      ])
      pdf.move_down 15

      # Return Flight Information
      pdf.text "RETURN INFORMATION", size: 12, style: :bold, align: :left
      pdf.stroke_horizontal_rule
      pdf.move_down 5
      create_info_table(pdf, [
        ["Departure", itinerary.return_departure_city, "Arrival", itinerary.return_arrival_city],
        ["Departure Date", format_date(itinerary.return_departure_date), "Arrival Date", format_date(itinerary.return_arrival_date)],
        ["Aircraft", itinerary.aircraft, "Class", itinerary.flight_class],
        ["Flight No.", itinerary.return_flight_number, "Booking Reference", itinerary.booking_reference]
      ])
      pdf.move_down 20

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
