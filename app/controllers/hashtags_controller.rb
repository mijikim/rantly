class HashtagsController < ApplicationController

  def show
    @hashtag = params[:id]
    @rants = Rant.search_hashtag("##{@hashtag}")
    @new_rant = Rant.new
  end
end