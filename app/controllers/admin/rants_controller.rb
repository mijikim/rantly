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

  def find_rants
    @all_rants = Rant.unscoped { Rant.where(created_at: start_date..end_date) }
    if params[:kind]
      @all_rants = Rant.unscoped { Rant.where(created_at: start_date..end_date, spam: true)}
    end
    render :index
  end

  private

  def rant
    Rant.unscoped { Rant.find(params[:id]) }
  end

  def start_date
    if params[:start_date]
      params[:start_date]
    else
      []
    end

  end

  def end_date
    if params[:end_date]
      params[:end_date]
    else
      []
    end
  end


end