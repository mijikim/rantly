class SearchesController < ApplicationController

  def new
    @new_rant = Rant.new
  end

  def show
    @new_rant = Rant.new
    @users = User.search(params[:search])
  end

end