class RantsController < ApplicationController

  def create
    @user = current_user
    @rant = Rant.new(allowed_params.merge(user_id: @user.id))

    if @rant.save
      redirect_to dashboard_path
    else
      render 'dashboard/show'
    end
  end

  def destroy
    @rant = Rant.find_by(id: params[:id])
    @rant.destroy
    redirect_to dashboard_path
  end

  private

  def allowed_params
    params.require(:rant).permit(:category, :rant)
  end

end