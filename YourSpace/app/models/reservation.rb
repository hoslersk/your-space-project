class Reservation < ApplicationRecord
  belongs_to :listing
  has_one :venue, through: :listing
  # delegates: :venue, to: :listing??
  has_one :host, through: :venue, :foreign_key => "host_id"
  belongs_to :renter, :foreign_key => "renter_id", :class_name => "User"

  # review?

end
