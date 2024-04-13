class ItinerariesController < ApplicationController
    # GET /itineraries
    def index
      @itineraries = Itinerary.all
    end
  
    # GET /itineraries/new
    def new
      @itinerary = Itinerary.new
    end
  
    # POST /itineraries
    def create
      @itinerary = Itinerary.new(itinerary_params)
      if @itinerary.save
        redirect_to @itinerary, notice: 'Itinerary was successfully created.'
      else
        render :new
      end
    end
  
    # GET /itineraries/:id
    def show
      set_itinerary
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
  