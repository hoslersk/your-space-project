class NotificationMailer < ApplicationMailer

  default from: 'schylerhosler@gmail.com'
  layout 'mailer'

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end

  # NotificationMailer.notification_email(@user).deliver #for use in UsersController

end
