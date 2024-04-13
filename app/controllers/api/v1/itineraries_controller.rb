class Api::V1::ItinerariesController < ApplicationController
    before_action :set_itinerary, only: [:show, :update, :destroy]
  
    # GET /itineraries
    def index
      @itineraries = Itinerary.all
      render json: @itineraries
    end
  
    # GET /itineraries/new
    # This action might still serve HTML to provide a form unless fully API-driven
  
    # POST /itineraries
    def create
      @itinerary = Itinerary.new(itinerary_params)
      if @itinerary.save
        render json: @itinerary, status: :created, location: @itinerary
      else
        render json: @itinerary.errors, status: :unprocessable_entity
      end
    end
  
    # GET /itineraries/:id
    def show
      render json: @itinerary
    end
  
    # Additional actions like `update` and `destroy` can also be set up to respond with JSON:
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
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_itinerary
        @itinerary = Itinerary.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def itinerary_params
        params.require(:itinerary).permit(:traveller_name, :booking_reference, :flight_number, :flight_class, :departure_city, :departure_date, :arrival_city, :arrival_date, :aircraft, :return_flight_number, :return_departure_city, :return_departure_date, :return_arrival_city, :return_arrival_date)
      end
end
  