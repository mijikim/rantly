class UsersController < ApplicationController
  skip_before_filter :ensure_authenticated_user, only: [:new, :create]
  layout "user_edit", only: [:edit, :update]

  def new
    @user = User.new
    render layout: 'layouts/homepage'
  end

  def create
    @user = User.new(allowed_params)

    if @user.save
      UserMailer.confirmation_email(@user).deliver
      session[:visiting_status] = "yes"
      flash[:notice] = "You have successfully registered"
      redirect_to root_path
    else
      render :new, layout: 'layouts/homepage'
    end
  end

  def edit
  end

  def update

    if current_user.update(allowed_params)
      flash[:notice] = "Profile was updated successfully!"
      redirect_to dashboards_path
    else
      flash[:notice] = "Please fill out all the fields"
      render :edit
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @new_rant = Rant.new
    @comment = Comment.new
  end

  private

  def allowed_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :email, :bio, :rant_frequency, :avatar)
  end

end