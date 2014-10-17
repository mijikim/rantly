class SessionsController < ApplicationController
  skip_before_filter :ensure_authenticated_user
  layout "homepage"

  def new
    @session = Session.new(username: "", password: "")
  end

  def create
    @session = Session.new(session_params)

    if @session.valid?
      set_session
      redirect_to dashboards_path
    else
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end

  def set_session
    session[:user_id] = @session.user_id
  end

end