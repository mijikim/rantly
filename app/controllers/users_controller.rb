class UsersController < ApplicationController
  skip_before_filter :ensure_authenticated_user
  layout "homepage", only: [:new, :create]
  layout "user_edit", only: [:edit, :update]

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
  end

  def update

    if current_user.update(allowed_params)
      flash[:notice] = "Profile was updated successfully!"
      redirect_to edit_user_path(current_user)
    else
      render :edit
    end
  end

  def show
    @new_rant = Rant.new
  end

  private

  def allowed_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :rant_frequency, :avatar)
  end

end