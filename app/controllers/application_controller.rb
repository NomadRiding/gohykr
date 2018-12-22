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

  def build_pagination(obj)
    page        = (params[:page] || 1).to_i
    per_page    = 7
    total_pages = (obj.count.to_f / per_page).ceil
    total_pages = 1 if total_pages.zero?
    obj.paginate(page: page, per_page: per_page)
  end
end
