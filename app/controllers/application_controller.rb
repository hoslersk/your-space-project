class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def logged_in?

  end

  def authenticate
  end

  def authorize
  end

  def current_user
  end
end
