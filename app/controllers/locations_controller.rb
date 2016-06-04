class LocationsController < ApplicationController

  def search
    search = URI.decode(params[:search])
    @locations = Location.new.fetch_locations(search)
    logger.info @locations

    render partial: 'shared/search_results', locals: { locations: @locations }
  end

end