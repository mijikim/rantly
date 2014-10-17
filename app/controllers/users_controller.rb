class UsersController < ApplicationController
  skip_before_filter :ensure_authenticated_user
  layout "user_edit", only: [:edit, :update]

  def new
    @user = User.new
    render layout: 'layouts/homepage'
  end

  def create
    @user = User.new(allowed_params)

    if @user.save
      session[:visiting_status] = "yes"
      flash[:notice] = "You have successfully registered"
      redirect_to new_user_path
    else
      render :new, layout: 'layouts/homepage'
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
    @user = User.find_by(id: params[:id])
    @ordered_rants = @user.rants.order(favorited: :desc)
    @new_rant = Rant.new
  end

  private

  def allowed_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :rant_frequency, :avatar)
  end

end