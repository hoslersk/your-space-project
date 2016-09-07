class Reservation < ApplicationRecord
  belongs_to :listing
  has_one :venue, through: :listing
  # has_one: :venue delegates: :venue, on: :listing??
  has_one :host, through: :venue, :foreign_key => "host_id"
  belongs_to :renter, :foreign_key => "renter_id", :class_name => "User"

  # review?

end
