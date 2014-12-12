module ApplicationHelper

  def page_title(page_title)
    content_for(:page_title) { page_title }
  end

  def page_keywords(page_keywords)
    content_for(:page_keywords) { page_keywords }
  end

  def page_description(page_description)
    content_for(:page_description) { page_description }
  end

  def success_message
    if flash[:notice].present?
      %Q[<div class="successMessage">#{flash[:notice]}</div>].html_safe
    end
  end
end
