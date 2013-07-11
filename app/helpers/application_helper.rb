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

  def tweet(msg)
    tweet = %Q[<a href="https://twitter.com/share" class="twitter-share-button" data-via="HackerNotes" data-text="#{msg}">Tweet</a>].html_safe
    content_for(:tweet) { tweet }
  end
end
