class WelcomeMailer < ApplicationMailer

  default from: 'flatiron.app.test@gmail.com'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to YourSpace!')
  end

end
