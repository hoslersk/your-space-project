class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      #byebug
      session[:user_id] = user.id
      #WelcomeMailer.welcome_email(@user).deliver
      redirect_to venues_path
    else
      redirect_to signup_path, notice: user.errors.full_messages.join(". ")
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :username, :first_name, :last_name, :email)
  end

end
