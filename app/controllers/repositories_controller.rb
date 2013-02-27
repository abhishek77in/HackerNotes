class RepositoriesController < ApplicationController

  def search
    keyword = params[:q].downcase
    @g_repos = Rails.cache.fetch(keyword, :expires_in => 1.weeks) do
      Github.new.search.repos(keyword: keyword)[:repositories]
    end
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
