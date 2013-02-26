module RepositoriesHelper

  def title(repo)
    link_to repo.name, user_name: repo.owner, repo_name: repo.name
  end

  def description(repo)
    "Watchers: <b>#{repo.watchers}</b><br/>#{repo.description}<br/>- created by: <b>#{repo.owner}</b>".html_safe
  end

end
