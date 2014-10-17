class HomepageController < ApplicationController
  skip_before_filter :ensure_authenticated_user
  layout "homepage"

  def show

    render :show

    session[:visiting_status] ||= "no"
  end

end