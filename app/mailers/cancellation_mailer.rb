class CancellationMailer < ApplicationMailer

  def cancellation_email(user)
    @user = user
    mail(to: @user.email, subject: 'YourSpace Reservation Has Been Cancelled! :(')
  end

end
