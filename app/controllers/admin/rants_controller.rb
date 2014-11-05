class Admin::RantsController < ApplicationController
  before_action :ensure_admin
  layout "admin"

  def index
    @all_rants = Rant.unscoped { Rant.all.order(created_at: :desc) }
    if params[:kind]
      @all_rants = Rant.unscoped { Rant.where(spam: true) }
    end
  end

  def show
    @rant = rant
  end

  def update
    @rant = rant
    rant.update(spam: false)
    redirect_to admin_rants_path
  end

  def destroy
    @rant = rant
    @rant.destroy
    redirect_to admin_rants_path
  end

  private

  def rant
    Rant.unscoped { Rant.find(params[:id]) }
  end

end