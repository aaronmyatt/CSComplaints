class Complaint < ActiveRecord::Base
  geocoded_by :address

  has_one :user

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :title, presence: true
  validates :description, presence: true
  # validates :lat, presence: true
  # validates :long, presence: true

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def nearby
    Complaint.near(self.address, 50, :order => false)
  end
end
