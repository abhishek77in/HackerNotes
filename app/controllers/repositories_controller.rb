class RepositoriesController < ApplicationController

  def search
    @g_repos = GithubService.new.search(params[:q])
  end

  def show_repo
    @repo = GithubService.new.fetch(params[:owner], params[:name])
    @subs_services = @repo.subscription_services.all
    @blogs = @repo.blogs.all
    @tips = @repo.tips.all
    @slides = @repo.slides.all
    @qnas = @repo.qnas.all
    @noteworthies = @repo.noteworthies.all
    @screencasts = @repo.screencasts.all
  end

end
