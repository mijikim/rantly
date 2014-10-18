class RantsController < ApplicationController

  def create
    @new_rant = Rant.new(allowed_params.merge(user_id: params[:user_id]))

    if @new_rant.save
      redirect_to dashboards_path
    else
      @all_rants = Rant.order(created_at: :desc).where(spam: false)
      render 'dashboards/show'
    end
  end

  def update
    @new_rant = Rant.new
    @rant = rant
    rant.update(spam: true)
    redirect_to user_rant_path
  end

  def destroy
    @rant = rant
    @rant.destroy
    redirect_to dashboards_path
  end

  def show
    @new_rant = Rant.new
    @rant = rant
  end

  private

  def allowed_params
    params.require(:rant).permit(:category, :rant)
  end

  def rant
    Rant.find_by(id: params[:id])
  end

end