module RantHelper

  def truncate(rant)
    if rant.scan(/[\w-]+/).size < 300
      rant
    else
      rant[/(\S+(\s+)?){,300}/].strip + "..."
    end
  end

  def favorite_rant_link(user_id, rant_id)
      if current_user.favorited?(rant_id)
        link_to "Unfavorite", user_rant_favorite_path(user_id, rant_id), id: "favorite", method: :delete
      else
        link_to "Favorite" , user_rant_favorites_path(user_id, rant_id), id: "favorite", method: :post
      end
  end

end