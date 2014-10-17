module UserHelper

  def follow_link(user_id)
    if current_user.following?(user_id)
      link_to "Unfollow", user_follow_path(user_id), id: "follow", method: :delete
    else
      link_to "Follow", user_follows_path(user_id), id: "follow", method: :post
    end
  end

end