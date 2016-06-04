class Complaint < ActiveRecord::Base
  geocoded_by :address
  belongs_to :user
  acts_as_votable

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :title, presence: true
  validates :description, presence: true
  # validates :lat, presence: true
  # validates :long, presence: true

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def nearby(location = "Kuala Lumpur")
    Complaint.near(location, 50, :order => false)
  end
end