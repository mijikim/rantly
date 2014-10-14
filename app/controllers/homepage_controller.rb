class HomepageController < ApplicationController
  skip_before_filter :ensure_authenticated_user
  layout "homepage"
  def show

  end

end