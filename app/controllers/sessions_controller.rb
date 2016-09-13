class SessionsController < ApplicationController

  def home
    @listing = Listing.new
  end

  def new

  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to venues_path
    else
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path
  end


end
