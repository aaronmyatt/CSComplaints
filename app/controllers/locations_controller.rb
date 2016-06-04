class LocationsController < ApplicationController

  def search
    search = params[:search]
    @locations = Location.new.fetch_locations(search)

    render partial: "shared/search_results", locals: { locations: @locations }
  end

end