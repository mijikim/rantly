class Admin::UsersController < ApplicationController
  before_action :ensure_admin
  layout "admin"

  def index
    @all_users = User.all
  end

  def update
    @user = user
    user.update(disabled: params[:value])
    redirect_to admin_users_path
  end

  private

  def user
    User.find_by(id: params[:id])
  end

end