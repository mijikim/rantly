class SessionsController < ApplicationController
  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create

    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path
    elsif params[:user][:username] == "" || params[:user][:password] == ""
      @user = User.new(username: params[:user][:username])
      @user.errors[:base] << "Username / Password Required"
      render :new
    else
      @user = User.new(username: params[:user][:username])
      @user.errors[:base] << "Login Failed"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end