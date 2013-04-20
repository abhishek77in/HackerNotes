module RepositoriesHelper

 NOTES = { 'Blogs' => 'blogs',
            'Subscribe' => 'subscribe',
            "Tips n Tricks" => 'tips',
            'Slides' => 'slides',
            'FAQ' => 'qnas',
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

  def link_to_vote(resource, direction)
    link_to(image_tag("vote_#{direction}.png"), '#', class: "vote vote#{direction.capitalize}", 'data-id' => resource.id, 'data-resource' => resource.model_name)
  end

  def description(repo)
    "#{repo.description}<br/>Created by: <b>#{repo.owner}</b>".html_safe
  end
end
