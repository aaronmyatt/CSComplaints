class Location
  # geocoded_by :address

  def fetch_locations(search = "Kuala Lumpur")
    begin
      location_results = Geocoder.search(search)
      locations = []

      if location_results.any?
        location_results.each do |location|
          address = location.formatted_address
          coords = location.geometry['location']

          lat = coords['lat'].to_s
          lng = coords['lng'].to_s

          locations << [ address, lat, lng ]
        end
      end
    rescue Exception => e
      puts "Unable to complete request"
      puts e.to_s
    end

    locations
  end
end