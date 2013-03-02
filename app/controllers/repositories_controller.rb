class RepositoriesController < ApplicationController

  def search
    keyword = optimize(params[:q])
    @g_repos = Rails.cache.fetch(keyword, :expires_in => 1.weeks) do
      Github.new.search.repos(keyword: keyword)[:repositories]
    end
  end

  def show_repo
    owner, name = params[:owner], params[:name]
    @repo = find(owner, name) || create(owner, name)
  end

  private
  def find(owner, name)
    Repository.where(owner: owner, name: name).first
  end

  def create(owner, name)
    g_repo = Github.new.repos.get(owner, name)
    Repository.create to_hackernotes(g_repo)
  end

  def optimize(keyword)
    keyword.strip.gsub(/\s*\s/,' ').downcase
  end
end
