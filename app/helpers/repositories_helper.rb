module RepositoriesHelper

 NOTES = { 'Blogs' => 'blogs',
            'Subscribe' => 'subscription_services',
            "Tips n Tricks" => 'tips',
            'Slides' => 'slides',
            'Tutorials' => 'tutorials',
            'Examples' => 'examples',
            'QnA' => 'qnas',
            'Screencasts' => 'screencasts',
            'Talks' => 'talks',
            'Noteworthy' => 'noteworthies' }

  def title_link(repo)
    link_to repo.name.capitalize, show_repo_path(repo.owner, repo.name)
  end

  def title(resources)
    NOTES.invert[resource_name(resources)]
  end

  def resource_name(resources)
    resources.name.to_s.underscore.pluralize
  end

  def template(resources)
    resource_name = resource_name(resources)
    return 'media' if resource_name == 'slides' || resource_name == 'talks' || resource_name == 'screencasts'
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

  def sidebar(resources, title, anchor = nil)
    return nil if resources.empty?
    anchor ||= resources.first.model_name.downcase.pluralize
    { anchor: "##{anchor}", title: title }
  end

end
