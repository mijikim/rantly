class RantsController < ApplicationController

  def create
    @user = current_user
    @rant = Rant.new(allowed_params.merge(user_id: @user.id))

    if @rant.save
      redirect_to dashboards_path
    else
      @users_rants = Rant.where(user_id: @user.id)
      @all_rants = Rant.order(created_at: :desc)
      render 'dashboards/show'
    end
  end

  def destroy
    @rant = Rant.find_by(id: params[:id])
    @rant.destroy
    redirect_to dashboards_path
  end

  private

  def allowed_params
    params.require(:rant).permit(:category, :rant)
  end

end