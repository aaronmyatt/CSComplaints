class Complaint < ActiveRecord::Base
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :title, presence: true
  validates :description, presence: true
  validates :lat, presence: true
  validates :long, presence: true
end
