module ApplicationHelper

  def page_title(page_title)
    content_for(:page_title) { page_title }
  end

  def success_message
    if flash[:notice].present?
      %Q[<div class="successMessage">#{flash[:notice]}</div>].html_safe
    end
  end

  def sidebar(resources, title, css_class = nil, anchor = nil)
    return nil if resources.empty?
    anchor = anchor || resources.first.model_name.downcase.pluralize
    { anchor: "##{anchor}", title: title, css_class: css_class }
  end
end
