class ReservationConfirmationMailer < ApplicationMailer

  default from: 'flatiron.app.test@gmail.com'
  layout 'mailer'

  def reservation_confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'YourSpace Reservation Has Been Confirmed!')
  end

end
