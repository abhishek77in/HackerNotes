class RepositoriesController < ApplicationController

  def search
    g = Github.new.search.repos(keyword: params[:q])
    @g_repos = g[:repositories]
  end

  def show_repo
    owner, name = params[:owner], params[:name]
    @repo = find(owner, name)
    @repo = create(owner, name) if @repo.nil?
  end

  private
  def find(owner, name)
    Repository.where(owner: owner, name: name).first
  end

  def create(owner, name)
    g_repo = Github.new.repos.get(owner, name)
    Repository.create to_hackernotes(g_repo)
  end

end
