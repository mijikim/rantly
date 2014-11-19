class Admin::AdminDashboardsController < ApplicationController
  before_action :ensure_admin
  layout "admin"

  def index
    @keen_list = KeenMetric.find_logins_per_hour
  end

end