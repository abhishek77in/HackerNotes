module ApplicationHelper

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
