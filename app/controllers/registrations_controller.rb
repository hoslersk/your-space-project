class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      #byebug
      session[:user_id] =  user.id
      redirect_to venues_path
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :username, :first_name, :last_name, :email)
  end

end
