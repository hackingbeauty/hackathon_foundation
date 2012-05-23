module ApplicationHelper

  def title
    base_title = "Title Goes Here"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

end
