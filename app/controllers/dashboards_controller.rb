class DashboardsController < ApplicationController
  before_action :ensure_authenticated_user

  def show
    @new_rant = Rant.new
    @all_rants = Rant.order(created_at: :desc).where("user_id != #{current_user.id}")
  end

end