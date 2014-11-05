class Admin::AdminRantsController < ApplicationController
  before_action :ensure_admin
  layout "admin"

  def index
    @all_rants = Rant.all.order(created_at: :desc)
    if params[:kind]
      @all_rants = Rant.unscoped { Rant.where(spam: true) }
    end
  end

end