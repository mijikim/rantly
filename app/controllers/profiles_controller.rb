class ProfilesController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(allowed_params)
      flash[:notice] = "Profile was updated successfully!"
      redirect_to edit_profile_path(@user)
    else
      render :edit
    end
  end


  private

  def allowed_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :rant_frequency)
  end
end