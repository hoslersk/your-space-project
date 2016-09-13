class Listing < ApplicationRecord
  belongs_to :venue
  has_one :host, through: :venue, :foreign_key => "host_id"
  has_many :reservations
  has_many :renters, through: :reservations, :foreign_key => :renter_id
  has_many :images, through: :venue
  # has_many :reviews

  validates :available_start_date, presence: {message: 'Please enter a start date'}
  validates :available_end_date, presence: {message: 'Please enter an end date'}
  validates :price, presence: {message: "Please enter an amount"}
  validates :price, numericality: {message: "Please enter a numeric value"}

  validate :no_overlap, :start_before_end

  def no_overlap
    # checks if there are listings conflicting prior to listing creation
    current_listings = Listing.where(venue_id: self.venue.id)
    current_listings.each do |current_listing|
      if self.available_start_date <= current_listing.available_end_date && self.available_end_date >= current_listing.available_start_date
        errors.add(:no_overlap, "There are listing(s) conflicts")
      end
    end
  end

  def start_before_end
    if self.available_end_date < self.available_start_date
      errors.add(:invalid_date_range, "The listing start date must be before the end date")
    end
  end

end
