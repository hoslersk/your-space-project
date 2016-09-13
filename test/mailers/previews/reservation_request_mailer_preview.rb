class ReservationRequestMailerPreview < ActionMailer::Preview
  def reservation_request_mail_preview
   ReservationRequestMailer.reservation_request_email(User.find_by(first_name: "Schyler"))
  end
end
