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
      flash[:notice] = "Please check your email to activate your account"
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
    build_user_hash
    @new_rant = Rant.new
    @comment = Comment.new

    respond_to do |format|
      format.html
      format.json {render json: @user_hash}
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :email, :bio, :rant_frequency, :avatar)
  end

  def build_user_hash
    @user_hash = {}
    @user_hash[:first_name] = @user.first_name.capitalize
    @user_hash[:url] = @user.avatar.url(:thumb)
  end
end