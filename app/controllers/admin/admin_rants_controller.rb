class Admin::AdminRantsController < ApplicationController
  before_action :ensure_admin
  layout "admin"

  def index
    @all_rants = Rant.all.order(created_at: :desc)
  end

end