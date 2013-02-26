class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def to_hackernotes(g_repo)
    { name: g_repo.name,
      owner: g_repo.owner.login,
      full_name: g_repo.full_name,
      description: g_repo.description,
      watchers_count: g_repo.watchers,
      forks_count: g_repo.forks }
  end
end
