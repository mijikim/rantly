module RantHelper

  def truncate(rant)
    if rant.scan(/[\w-]+/).size < 300
      rant
    else
      rant[/(\S+(\s+)?){,300}/].strip + "..."
    end
  end

  # def favorite_rant(user_id, rant_id)
  #   if current_user.following?(rant_id)
  #     link_to "Unfollow", user_follow_path(user_id), id: "favorite", method: :delete
  #   else
  #     link_to "Follow", user_follows_path(user_id), id: "favorite", method: :post
  #   end
  # end

end