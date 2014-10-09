class UserRelationshipsController < ApplicationController

  def index
    @followed_users = user.followed_users
    @user = user
    @rant = Rant.new
  end

  def create
    current_user.follow_user(user)
    redirect_to dashboards_path
  end

  def destroy
    current_user.unfollow_user(user)
    redirect_to dashboards_path
  end

  private

  def user
    @_user ||= User.find_by(id: params[:user_id])
  end

end