class FavoritedRantsController < ApplicationController

  def index
    @new_rant = Rant.new
    @favorite_rants = user.all_favorite_rants
  end

  def create
    current_user.favorite_rant(params[:rant_id])
    increment_favorited
    message = {
      "msg" => "Success"
    }
    render :json => message
  end

  def destroy
    @favorite_rant = find_favorite_rant
    @favorite_rant.destroy
    decrement_favorited
    message = {
      "msg" => "Success"
    }
    render :json => message
  end


  private

  def user
    User.find(params[:user_id])
  end

  def find_favorite_rant
    FavoritedRant.find_by(user_id: params[:user_id], rant_id: params[:rant_id])
  end

  def increment_favorited
    Rant.increment_counter(:favorited, params[:rant_id])
  end

  def decrement_favorited
    Rant.decrement_counter(:favorited, params[:rant_id])
  end

end