class ImpersonateController < ApplicationController
  before_filter :ensure_admin

  def new
    session[:admin_id] = current_user.id
    session[:user_id] = params[:user_id]
    redirect_to dashboards_path
  end

  def destroy
    session[:user_id] = session[:admin_id]
    session[:admin_id] = nil
    redirect_to admin_users_path
  end

end