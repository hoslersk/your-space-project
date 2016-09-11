class ReservationUpdateMailer < ApplicationMailer

  default from: 'flatiron.app.test@gmail.com'
  layout 'mailer'

  def reservation_update_email(user)
    @user = user
    mail(to: @user.email, subject: 'YourSpace Reservation Has Been Updated!')
  end

end
