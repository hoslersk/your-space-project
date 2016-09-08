class Venue < ApplicationRecord
  has_many :listings
  has_many :reservations, through: :listings
  has_many :renters, through: :reservations, :foreign_key => "renter_id"
  belongs_to :host, :class_name => "User"
  # has_many :reviews, through: :listings

end
