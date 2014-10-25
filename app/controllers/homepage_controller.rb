class HomepageController < ApplicationController
  skip_before_filter :ensure_authenticated_user
  layout "homepage"

  def show
    if current_user
      redirect_to dashboards_path
    else
      render :show
      session[:visiting_status] ||= "no"
    end

  end

end