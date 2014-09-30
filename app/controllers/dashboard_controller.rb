class DashboardController < ApplicationController
  before_action :ensure_authenticated_user

  def show
    @user = current_user
    @rant = Rant.new
  end

end