class ReservationUpdateMailerPreview < ActionMailer::Preview
  def reservation_update_mail_preview
   ReservationUpdateMailer.reservation_update_email(User.find_by(first_name: "Schyler"))
  end
end
