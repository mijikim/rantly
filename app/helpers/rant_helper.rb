module RantHelper

  def truncate(rant)
    rant[/(\S+(\s+)?){,300}/].strip + "..."
  end

end