class Listing < ApplicationRecord
  belongs_to :venue
  has_one :host, through: :venue, :foreign_key => "host_id"
  has_many :reservations
  has_many :renters, through: :reservations, :foreign_key => :renter_id
  # has_many :reviews
end
