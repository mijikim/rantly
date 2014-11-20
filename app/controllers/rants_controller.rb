class RantsController < ApplicationController

  def create
    @new_rant = Rant.new(allowed_params.merge(user_id: params[:user_id]))

    if @new_rant.save
      followers = @new_rant.user.followers
      followers.each do |follower|
        UserMailer.new_rant_email(@new_rant, follower).deliver
      end
      render json: @new_rant
    else
      @all_rants = Rant.order(created_at: :desc).where("user_id != #{current_user.id}")
      raise
    end
  end

  def update
    @new_rant = Rant.new
    @rant = rant
    rant.update(spam: true)
    redirect_to dashboards_path
  end

  def destroy
    @rant = rant
    @rant.destroy
    redirect_to dashboards_path
  end

  def show
    @new_rant = Rant.new
    @rant = rant
    @comment = Comment.new
  end

  private

  def allowed_params
    params.require(:rant).permit(:category, :rant)
  end

  def rant
    Rant.find_by(id: params[:id])
  end

end