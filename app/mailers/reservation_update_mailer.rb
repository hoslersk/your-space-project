class ReservationUpdateMailer < ApplicationMailer

  def reservation_update_email(user)
    @user = user
    mail(to: @user.email, subject: 'YourSpace Reservation Has Been Updated!')
  end

end
