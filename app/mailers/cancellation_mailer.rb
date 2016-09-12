class CancellationMailer < ApplicationMailer

  default from: 'flatiron.app.test@gmail.com'
  layout 'mailer'

  def cancellation_email(user)
    @user = user
    mail(to: @user.email, subject: 'YourSpace Reservation Has Been Cancelled! :(')
  end

end
