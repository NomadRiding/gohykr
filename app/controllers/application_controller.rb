class ApplicationController < ActionController::Base

  def logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :logged_in?

  def current_user
    User.find(session[:user_id])
  end

  def require_user
    if !logged_in?
      redirect_to login_path
    end
  end

  helper_method :current_user
end
