class RepositoriesController < ApplicationController

  def search
    @g_repos = GithubService.new.search(params[:q])
  end

  def show_repo
    @repo = GithubService.new.fetch(params[:owner], params[:name])
  end

end
