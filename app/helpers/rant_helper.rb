module RantHelper

  def truncate(rant)
    if rant.scan(/[\w-]+/).size < 300
      rant
    else
      rant[/(\S+(\s+)?){,300}/].strip + "..."
    end
  end

  def hashtagable(text)
    link_hashtags(strip_tags(text)).html_safe
  end

  def favorite_rant_link(user_id, rant_id)
      if current_user.favorited?(rant_id)
        link_to "Unfavorite", user_rant_favorite_path(user_id, rant_id), class: "unfavorite-#{rant_id}", id: "#{rant_id}", data: { user: user_id, rant: rant_id }
      else
        link_to "Favorite" , user_rant_favorites_path(user_id, rant_id), class: "favorite-#{rant_id}", id: "#{rant_id}", data: { user: user_id, rant: rant_id }
      end
  end

  def rant_comments(rant)
    rant.comments.where(commentable_type: "Rant")
  end

  def link_hashtags(text)
    text.gsub(/#\w+/) { |match| link_to match, hashtag_path(match[1..-1]), id: "hashtag" }
  end

end