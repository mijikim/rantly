class DashboardsController < ApplicationController
  before_action :ensure_authenticated_user

  def show
    @new_rant = Rant.new
    @all_rants = Rant.latest_rants(current_user.id)
    @mentioned_rants = Rant.search_mentioned(current_user.username)
  end

end