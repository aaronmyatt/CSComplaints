class LocationsController < ApplicationController

  def search
    search = params[:search]
    @locations = Location.new.fetch_locations(search)
    logger.info @locations

    respond_to do |format|
      format.js {
        render partial: 'search_results', locals: { locations: @locations }
      }
    end
  end

end