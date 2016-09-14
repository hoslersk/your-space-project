class ReservationCancellationNotifier

  def self.execute(reservation)
    reservation_destroyer(reservation)
    cancellation_for_host(reservation)
    cancellation_for_renter(reservation)
  end

  def self.reservation_destroyer(reservation)
    reservation.destroy
  end

  def self.cancellation_for_host(reservation)
    CancellationMailer.cancellation_email(reservation.host).deliver
  end

  def self.cancellation_for_renter(reservation)
    CancellationMailer.cancellation_email(reservation.renter).deliver
  end

end
