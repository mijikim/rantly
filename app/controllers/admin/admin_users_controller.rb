class Admin::AdminUsersController < ApplicationController
  before_action :ensure_admin
  layout "admin"

  def index
    @all_users = User.all
  end

end