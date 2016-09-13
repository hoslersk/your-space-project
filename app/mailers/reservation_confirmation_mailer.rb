class ReservationConfirmationMailer < ApplicationMailer

  def reservation_confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'YourSpace Reservation Has Been Confirmed!')
  end

end
