class Venue < ApplicationRecord
  has_many :listings
  has_many :reservations, through: :listings
  has_many :renters, through: :reservations, :foreign_key => "renter_id"
  belongs_to :host, :class_name => "User"
  has_many :images
  # has_many :reviews, through: :listings

  validates :name, presence: {message: 'Please enter a name'}
  validates :address, presence: {message: 'Please enter a street address'}
  validates :city, presence: {message: 'Please enter a city'}
  validates :zip_code, presence: {message: 'Please enter a zip code'}
  validates :description, presence: {message: 'Please enter a description'}

  accepts_nested_attributes_for :images

end
