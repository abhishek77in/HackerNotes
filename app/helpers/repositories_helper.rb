module RepositoriesHelper

 NOTES = { 'Blogs' => 'blogs',
            'Subscribe' => 'subscribe',
            "Tips n Tricks" => 'tips',
            'Slides' => 'slides',
            'QnA' => 'qnas',
            'Screencasts' => 'screencasts',
            'Videos' => 'videos',
            'Noteworthy' => 'noteworthies' }

  def title_link(repo)
    link_to repo.name.capitalize, show_repo_path(repo.owner, repo.name)
  end

  def title(resources)
    NOTES.invert[meta_id(resources)]
  end

  def meta_id(resources)
    resources.name.to_s.downcase.pluralize
  end

  def template(resources)
    return 'media' if meta_id(@resources) == 'slides' || meta_id(@resources) == 'videos'
    'resources'
  end

  def link_to_vote(resource, direction)
    link_to(image_tag("vote_#{direction}.png"), '#', class: "vote vote#{direction.capitalize}", 'data-id' => resource.id, 'data-resource_type' => resource.model_name)
  end

  def link_to_remove_if_power_user(resource, repo)
    link_to('remove',
            '#',
            class: "remove",
            'data-id' => resource.id,
            'data-resource_type' => resource.model_name) if current_user.power_user?(repo.owner)
  end

  def description(repo)
    "#{repo.description}<br/>Created by: <b>#{repo.owner}</b>".html_safe
  end
end
