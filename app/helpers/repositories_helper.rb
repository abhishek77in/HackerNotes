module RepositoriesHelper

  def title(repo)
    link_to repo.name.capitalize, show_repo_path(repo.owner, repo.name)
  end

  def description(repo)
    "Watchers: <b>#{repo.watchers}</b><br/>#{repo.description}<br/>Created by: <b>#{repo.owner}</b>".html_safe
  end

end
