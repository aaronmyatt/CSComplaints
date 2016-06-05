class Complaint < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  paginates_per 10
  geocoded_by :address
  belongs_to :user
  acts_as_votable

  has_many :payments
  has_many :supporters, through: :payments, source: :user

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :title, presence: true
  validates :description, presence: true

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def nearby(location = "Kuala Lumpur")
    Complaint.near(location, 50, :order => false)
  end


  def total_amount
    payments.reduce(0) {|sum,x| sum + x.amount}
  end

  def total_votes
    self.votes_for.size
  end
end
