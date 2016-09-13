class ReservationRequestMailer < ApplicationMailer

  def reservation_request_email(user)
    @user = user
    mail(to: @user.email, subject: 'YourSpace Reservation Request Has Been Received!')
  end

end
