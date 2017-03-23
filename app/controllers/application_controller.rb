class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    return true if current_user
    false
  end

  def log_out
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def ensure_logged_out
    redirect_to artists_url if logged_in?
  end

end
