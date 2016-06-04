class LocationsController < ApplicationController

  def search
    search = params[:search]
    @locations = Location.new.fetch_locations(search)
    render json: @locations.to_json
  end

end