class Api::V1::ItinerariesController < ApplicationController
  before_action :set_itinerary, only: [:show, :update, :destroy, :print_pdf]

  # GET /itineraries
  def index
    @itineraries = Itinerary.all
    render json: @itineraries
  end

  # POST /itineraries
  def create
    @itinerary = Itinerary.new(itinerary_params)
    if @itinerary.save
      render json: @itinerary, status: :created, location: api_v1_itinerary_url(@itinerary)
    else
      render json: @itinerary.errors, status: :unprocessable_entity
    end
  end

  # GET /itineraries/:id
  def show
    render json: @itinerary
  end

  # PATCH/PUT /itineraries/:id
  def update
    if @itinerary.update(itinerary_params)
      render json: @itinerary
    else
      render json: @itinerary.errors, status: :unprocessable_entity
    end
  end

  # DELETE /itineraries/:id
  def destroy
    @itinerary.destroy
    head :no_content
  end

  # GET /itineraries/:id/print
  def print_pdf
    respond_to do |format|
      format.pdf do
        pdf = ItineraryPdfGenerator.generate(@itinerary)
        send_data pdf.render, filename: "itinerary_#{params[:id]}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  private

    def set_itinerary
      @itinerary = Itinerary.find(params[:id])
    end

    def itinerary_params
      params.require(:itinerary).permit(:traveller_name, :booking_reference, :flight_number, :flight_class, :departure_city, :departure_date, :arrival_city, :arrival_date, :aircraft, :return_flight_number, :return_departure_city, :return_departure_date, :return_arrival_city, :return_arrival_date)
    end

   
end
