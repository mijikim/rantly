class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_authenticated_user


  def ensure_authenticated_user
    redirect_to root_path unless current_user
  end

  def ensure_admin
    redirect_to root_path unless admin
  end

  def admin
    User.where(admin: true)
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  helper_method :current_user

  def impersonating?
    session[:admin_id].present?
  end
  helper_method :impersonating?

end
