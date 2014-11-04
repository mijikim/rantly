class Admin::AdminDashboardsController < ApplicationController
  before_action :ensure_admin
  layout "admin"

  def index

  end

end