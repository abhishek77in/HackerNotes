module ApplicationHelper

  def sidebar(resources, title, css_class = nil, anchor = nil)
    return nil if resources.empty?
    anchor = anchor || resources.first.model_name.downcase.pluralize
    { anchor: "##{anchor}", title: title, css_class: css_class }
  end

  def error_message_for(object, attribute)
    return if object.nil?
    if (errors = object.errors[attribute]).present?
      %Q[<div class="inlineValidationMessage">#{errors.join(', ')}</div>].html_safe
    end
  end

  def global_validation_message
    if flash[:alert].present?
      %Q[<div class="globalValidationMessage">#{flash[:alert]}</div>].html_safe
    end
  end

  def global_success_message
    if flash[:notice].present?
      %Q[<div class="globalSuccessMessage">#{flash[:notice]}</div>].html_safe
    end
  end
end
