class RepositoriesController < ApplicationController

  def search
    g = Github.new.search.repos(keyword: params[:q])
    @g_repos = g[:repositories]
  end

  def show
    @repo = Repository.find params[:id]
  end

  def create
    github_repo = Github.new.repos.get params[:user_name], params[:repo_name]
    Repository.find_or_create to_hackernotes(github_repo)
    redirect_to :show
  end

end
