module RepositoriesHelper

 NOTES = { 'Blogs' => 'blogs',
            'Subscribe' => 'subscription_services',
            "Tips n Tricks" => 'tips',
            'Slides' => 'slides',
            'QnA' => 'qnas',
            'Screencasts' => 'screencasts',
            'Videos' => 'videos',
            'Talks' => 'talks',
            'Noteworthy' => 'noteworthies' }

  def title_link(repo)
    link_to repo.name.capitalize, show_repo_path(repo.owner, repo.name)
  end

  def title(resources)
    NOTES.invert[meta_id(resources)]
  end

  def meta_id(resources)
    resources.name.to_s.underscore.pluralize
  end

  def template(resources)
    return 'media' if meta_id(@resources) == 'slides' || meta_id(@resources) == 'talks' || meta_id(@resources) == 'videos'
    'resources'
  end

  def link_to_vote(resource, direction)
    link_to(image_tag("vote_#{direction}.png",
                       alt: "vote #{direction}"),
                       '#',
                       class: "vote vote#{direction.capitalize}",
                       'data-id' => resource.id,
                       'data-resource_type' => resource.model_name)
  end

  def link_to_remove_if_power_user(resource, repo)
    link_to(image_tag("delete.png", alt: "remove"),
            '#',
            class: "remove",
            'data-id' => resource.id,
            'data-resource_type' => resource.model_name) if current_user && current_user.power_user?(repo.owner)
  end

  def description(repo)
    "#{repo.description}<br/>Created by: <b>#{repo.owner}</b>".html_safe
  end

  def sidebar(resources, title, css_class = nil, anchor = nil)
    return nil if resources.empty?
    anchor = anchor || resources.first.model_name.downcase.pluralize
    { anchor: "##{anchor}", title: title, css_class: css_class }
  end

end
