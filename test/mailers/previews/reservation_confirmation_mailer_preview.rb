class ReservationConfirmationMailerPreview < ActionMailer::Preview
  def reservation_confirmation_mail_preview
   ReservationConfirmationMailer.reservation_confirmation_email(User.find_by(first_name: "Schyler"))
  end
end
