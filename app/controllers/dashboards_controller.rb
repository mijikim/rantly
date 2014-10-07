class DashboardsController < ApplicationController
  before_action :ensure_authenticated_user

  def show
    @user = current_user
    @rant = Rant.new
    @all_rants = Rant.order(created_at: :desc)
  end

end