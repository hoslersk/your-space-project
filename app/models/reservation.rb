class Reservation < ApplicationRecord
  belongs_to :listing
  has_one :venue, through: :listing
  # delegates: :venue, to: :listing??
  has_one :host, through: :venue, :foreign_key => "host_id"
  belongs_to :renter, :foreign_key => "renter_id", :class_name => "User"

  # review?

  validate :date_is_valid, :no_reservation_conflicts

 def date_is_valid
   # reservation request falls within listing availability dates
   if self.start_date < self.listing.available_start_date || self.end_date > self.listing.available_end_date
     errors.add(:date_is_invalid, "reservation date must be within the listing dates")
   end
 end


 def no_reservation_conflicts

   # appends error if reservation request conflicts with other confirmed reservations for the listing
   confirmed_reservations = Reservation.where(listing_id: self.listing.id, confirmed: true)
   confirmed_reservations.each do |confirmed_reservation|
     if self.start_date <= confirmed_reservation.end_date && self.end_date >= confirmed_reservation.start_date
       errors.add(:reservation_conflicts, "reservation conflicts")
     end
   end
 end

end
