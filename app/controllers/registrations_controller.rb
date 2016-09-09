class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      NotificationMailer.notification_email(@user).deliver
      redirect_to home_path(@user)
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :username, :first_name, :last_name, :email)
  end

end
