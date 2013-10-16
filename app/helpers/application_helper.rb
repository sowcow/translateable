module ApplicationHelper
  def crumbs *a
    a.map { |x|
      case x
      when :home then
        ['home', ?/]
      when :texts then
        ['texts', texts_path]
      when :new then
        ['new child', nil]
      when Text then
        [x.title, x]
      else throw end
    }
  end

  def breadcrumbs *given
    content_for :breadcrumbs do
      render partial: 'breadcrumbs', locals: {
        given: crumbs(*given)
      }
    end
  end

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
