class RegistrationsController < ApplicationController
  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)

    if @user.save
      flash[:notice] = "You have successfully registered"
      redirect_to new_registration_path
    else
      render :new
    end
  end

  private

  def allowed_params
    params.fetch(:user, {}).permit(:username, :first_name, :last_name, :password, :bio, :rant_frequency)
  end

end