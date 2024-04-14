require 'prawn'
require 'prawn/table'

class ItineraryPdfGenerator
  def self.generate(itinerary)
    Prawn::Document.new(margin: [0, 40, 40, 40]) do |pdf|
      pdf.font "Helvetica"

      # First, generate the departure page with header
      generate_page_header(pdf, itinerary)

      # Departure Information
      pdf.text "DEPARTURE INFORMATION", size: 12, style: :bold, align: :left
      pdf.stroke_horizontal_rule
      pdf.move_down 5
      itinerary.departure_flights.each do |flight|
        create_info_table(pdf, flight)
        pdf.move_down 20  # Increased space before baggage information
        pdf.text "Baggage Information", size: 10, style: :bold
        pdf.text "Cabin Bag: #{flight.cabin_bag}", size: 10
        pdf.text "Checked Bags: #{flight.checked_bags}", size: 10
        pdf.move_down 10
      end

      # Start a new page for return information
      pdf.start_new_page

      # Generate the return page with header
      generate_page_header(pdf, itinerary)

      # Return Flight Information
      pdf.text "RETURN INFORMATION", size: 12, style: :bold, align: :left
      pdf.stroke_horizontal_rule
      pdf.move_down 5
      itinerary.return_flights.each do |flight|
        create_info_table(pdf, flight)
        pdf.move_down 20  # Increased space before baggage information
        pdf.text "Baggage Information", size: 10, style: :bold
        pdf.text "Cabin Bag: #{flight.cabin_bag}", size: 10
        pdf.text "Checked Bags: #{flight.checked_bags}", size: 10
        pdf.move_down 10
      end

      # Footer for page numbering
      pdf.number_pages "Page <page> of <total>", at: [pdf.bounds.right - 50, 0]
    end
  end

  def self.generate_page_header(pdf, itinerary)
    # Logo and passenger info
    logo_path = Rails.root.join('travel_logo.jpg')  # Absolute path to the logo
    pdf.image logo_path.to_s, at: [pdf.bounds.left, pdf.bounds.top], width: 150
    pdf.move_down 60

    # Title
    pdf.text "Flight Itinerary", size: 18, style: :bold, align: :center
    pdf.move_down 20

    # Passenger Information
    pdf.text "PASSENGER INFORMATION", size: 12, style: :bold, align: :left
    pdf.stroke_horizontal_rule
    pdf.move_down 5
    full_name = "#{itinerary.title} #{itinerary.traveller_name}"  # Concatenate title and name
    pdf.text "Name of Traveller: <color rgb='000000'>#{full_name}</color>", inline_format: true, size: 11
    pdf.text "Booking Reference: <color rgb='000000'>#{itinerary.booking_reference}</color>", inline_format: true, size: 11
    pdf.move_down 10
  end

  def self.create_info_table(pdf, flight)
    pdf.table([
      ["Departure", flight.departure_city, "Arrival", flight.arrival_city],
      ["Departure Date", format_date(flight.departure_date), "Arrival Date", format_date(flight.arrival_date)],
      ["Aircraft", flight.aircraft, "Class", flight.flight_class],
      ["Flight No.", flight.flight_number, "Seat No", flight.seat_number]
    ], cell_style: { borders: [], padding: [3, 5, 3, 5], inline_format: true }, column_widths: [70, 180, 70, 180]) do
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
