class ReservationRequestMailer < ApplicationMailer

  default from: 'flatiron.app.test@gmail.com'
  layout 'mailer'

  def reservation_request_email(user)
    @user = user
    mail(to: @user.email, subject: 'YourSpace Reservation Request Has Been Received!')
  end

end
