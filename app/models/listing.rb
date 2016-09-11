class Listing < ApplicationRecord
  belongs_to :venue
  has_one :host, through: :venue, :foreign_key => "host_id"
  has_many :reservations
  has_many :renters, through: :reservations, :foreign_key => :renter_id
  has_many :images, through: :venue
  # has_many :reviews

  validates :available_start_date, presence: {message: 'Please enter a date'}
  validates :available_end_date, presence: {message: 'Please enter a date'}
  validates :price, presence: {message: "Please enter an amount"}
  validates :price, numericality: {message: "Please enter a numeric value"}


end
