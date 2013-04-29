module ApplicationHelper

  def sidebar(resources, title, css_class = nil, anchor = nil)
    return nil if resources.empty?
    anchor = anchor || resources.first.model_name.downcase.pluralize
    { anchor: "##{anchor}", title: title, css_class: css_class }
  end
end
