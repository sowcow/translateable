module ApplicationHelper
  def the_title
    if content_for?(:title)
      content_for :title
    else
      if content_for?(:header)
        content_for :header
      else
        '...'
      end
    end
  end
end
