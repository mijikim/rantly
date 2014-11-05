module UserHelper

  def follow_link(user_id)
    if current_user.following?(user_id)
      link_to "Unfollow", user_follow_path(user_id), id: "follow", method: :delete
    else
      link_to "Follow", user_follows_path(user_id), id: "follow", method: :post
    end
  end

  def profile_comments(user)
    user.comments.where(commentable_type: "User")
  end

  def ordered_rants(user)
    user.rants.order(favorited: :desc)
  end

  def full_name(user)
    [user.first_name, user.last_name].join(" ").titleize
  end

  def disable_link(user)
    if user.disabled
      link_to "Enable", admin_user_path(user, value: false), method: :patch
    else
      link_to "Disable", admin_user_path(user, value: true), method: :patch
    end
  end

end