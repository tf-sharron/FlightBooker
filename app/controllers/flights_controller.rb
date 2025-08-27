class FlightsController < ApplicationController
  def index
    # Dropdown options
    @airports = Airport.all
    @dates    = Flight.all.map(&:date).uniq.sort

    # Default empty result
    @flights = []

    if params[:departure_airport_id].present? &&
       params[:arrival_airport_id].present? &&
       params[:date].present? &&
       params[:passengers].present?

      @flights = Flight.where(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id:   params[:arrival_airport_id]
      ).where("DATE(date) = ?", params[:date].to_date)

      # Save passengers into instance variable so we can use it in results or next form
      @passengers = params[:passengers].to_i
    end
  end
end


