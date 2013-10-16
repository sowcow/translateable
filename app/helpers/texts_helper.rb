module TextsHelper
  def header_link_to title, object, options = {}
    options = { class: 'tiny secondary round button' }
              .merge options
    link_to title, object, options
  end
end
