class UsersController < ApplicationController
  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)

    if @user.save
      flash[:notice] = "You have successfully registered"
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(allowed_params)
      flash[:notice] = "Profile was updated successfully!"
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end


  private

  def allowed_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :rant_frequency)
  end

end