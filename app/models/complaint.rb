class Complaint < ActiveRecord::Base
  geocoded_by :address

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :title, presence: true
  validates :description, presence: true
  # validates :lat, presence: true
  # validates :long, presence: true

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def nearby
    Complaint.near(self.address, 50, :order => false)
  end

  def fetch_locations
    begin
      location_results = Geocoder.search("Kuala Lumpur")
      locations = []

      if location_results.any?
        location_results.each do |location|
          logger.info location

          address = location.formatted_address
          coords = location.geometry['location']

          lat = coords['lat'].to_s
          lng = coords['lng'].to_s

          locations << [ address, lat, lng ]
        end
      end
    rescue Exception => e
      logger.info "Unable to complete request"
      logger.info e.to_s
    end

    locations
  end
end