class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user, :authorize

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #byebug
  end

  def logged_in?
    !!current_user
  end

  def authorize
    redirect_to home_path, notice: "Please log in" unless logged_in?
  end

end
