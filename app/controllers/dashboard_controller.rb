class DashboardController < ApplicationController
  before_action :ensure_authenticated_user

  def show
    @user = current_user
    @rant = Rant.new
    @users_rants = Rant.where(user_id: @user.id)
  end

end