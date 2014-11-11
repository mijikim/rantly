class SessionsController < ApplicationController
  skip_before_filter :ensure_authenticated_user
  layout "homepage"

  def new
    @session = Session.new(username: "", password: "")
  end

  def create
    @session = Session.new(session_params)

    if @session.user_disabled?
      flash[:errors] = "Your account has been disabled"
      render :new
    else
      if @session.valid?
        if @session.user_activated?
          if @session.user_admin?
            set_session
            redirect_to admin_dashboard_path
          else
            Keen.publish("logins", {username: @session.username})
            set_session
            redirect_to dashboards_path
          end
        else
          flash[:errors] = "Please activate your account"
          render :new
        end
      else
        render :new
      end
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