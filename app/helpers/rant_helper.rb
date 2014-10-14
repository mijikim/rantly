module RantHelper

  def truncate(rant)
    if rant.scan(/[\w-]+/).size < 300
      rant
    else
      rant[/(\S+(\s+)?){,300}/].strip + "..."
    end
  end

end