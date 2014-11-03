class AccountActivationsController < ApplicationController
  skip_before_filter :ensure_authenticated_user

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(params[:token])
      user.update_attribute(:activated,    true)
      user.update_attribute(:activated_at, Time.zone.now)
      flash[:notice] = "Account is activated"
      redirect_to root_path
    else
      flash[:errors] = "Invalid activation link"
      redirect_to root_path
    end
  end

end