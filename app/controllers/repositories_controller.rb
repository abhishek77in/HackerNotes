class RepositoriesController < ApplicationController

  def search
    @g_repos = GithubService.new.search(params[:q])
  end

  def show_repo
    @repo = GithubService.new.fetch(params[:owner], params[:name])
    @videos = @repo.videos.all
    @tweeters = @repo.tweeters.all
    @subs_services = @repo.subscription_services.all
    @blogs = @repo.blogs.all
    @tips = @repo.tips.all
    @slides = @repo.slides.all
    @qnas = @repo.qnas.all
    @noteworthies = @repo.noteworthies.all
    @screencasts = @repo.screencasts.all
  end

  def create_note
    @repo = Repository.find(params[:id].keys.first)
    resource = params[:resource].to_sym
    note = @repo.send(resource).new(url: params[:url], user: current_user)
    if note.save!
      flash[:notice] = "#{resource} created!"
      redirect_to action: show_repo, owner: @repo.owner, name: @repo.name
    else
      flash[:alert] = "Please resolve following errors and retry"
      render :show_repo
    end
  end
end
