class Reservation < ApplicationRecord
    validate :date_is_valid, :no_reservation_conflicts, :start_before_end
    validates :listing_id, presence: {message: 'Please enter a listing id'}
    validates :renter_id, presence: {message: 'Please enter a renter id'}
    validates :start_date, presence: {message: 'Please enter a start date'}
    validates :end_date, presence: {message: 'Please enter an end date'}



  belongs_to :listing
  has_one :venue, through: :listing
  # delegates: :venue, to: :listing??
  has_one :host, through: :venue, :foreign_key => "host_id"
  belongs_to :renter, :foreign_key => "renter_id", :class_name => "User"

  # review?



 def date_is_valid
   # reservation request falls within listing availability dates
   if self.start_date < self.listing.available_start_date || self.end_date > self.listing.available_end_date
     errors.add(:date_is_invalid, "Reservation date must be within the listing dates")
   end
 end

 def start_before_end
   if self.end_date < self.start_date
     errors.add(:invalid_date_range, "The start date must be before the end date")
   end
 end


 def no_reservation_conflicts
   # appends error if reservation request conflicts with other confirmed reservations for the listing
   confirmed_reservations = Reservation.where(listing_id: self.listing.id, confirmed: true)
   confirmed_reservations.each do |confirmed_reservation|
     if self.start_date <= confirmed_reservation.end_date && self.end_date >= confirmed_reservation.start_date
       errors.add(:reservation_conflicts, "There are reservation(s) conflicts")
     end
   end
 end

end
