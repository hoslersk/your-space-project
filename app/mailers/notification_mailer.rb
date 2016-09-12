class NotificationMailer < ApplicationMailer

  default from: 'flatiron.app.test@gmail.com'
  layout 'mailer'

  def notification_email(user)
    @user = user
    mail(to: @user.email, subject: 'Notification Email')
  end

  # NotificationMailer.notification_email(@user).deliver #for use in UsersController

end
