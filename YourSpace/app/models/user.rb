class User < ApplicationRecord
  has_many :renter_reservations, :foreign_key => "renter_id", :class_name => "Reservation"
  has_many :renter_listings, through: :renter_reservations, :source => :listing
  has_many  :renter_venues, through: :renter_listings, :source => :venue

  has_many :host_venues, :foreign_key => "host_id", :class_name => "Venue"
  has_many :host_listings, through: :host_venues, :source => :listings
  has_many :host_reservations, through: :host_listings, :source => :reservations
  # has_many :reviews, :foreign_key => “host_id”, :class_name => "Review"
  has_secure_password
end
