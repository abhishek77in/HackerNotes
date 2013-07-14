class RepositoriesController < RepositoriesBaseController

  def search
    @g_repos = GithubService.new.search(params[:q])
  end

  def show
    @repo = find_repo(params)
    popuplate_resources
  end

  def show_resources
    @repo = find_repo(params)
    @resources = @repo.send(params[:resource]).page params[:page]
    @menu = menu.compact
  end

  def create_note
    @repo = Repository.find(params[:id].keys.first)
    resource_type = params[:resource]
    @note = @repo.send(resource_type).new(url: params[:url], user: current_user)
    if @note.save
      flash[:notice] = "#{resource_type.singularize.capitalize} added!"
      redirect_to show_repo_path({ owner: @repo.owner, name: @repo.name })
    else
      flash[:alert] = "Please resolve following errors and retry"
      popuplate_resources
      render :show
    end
  end

  private
  def popuplate_resources
    @videos = @repo.videos.limit(4)
    @talks = @repo.talks.limit(4)
    @tweeters = @repo.tweeters.limit(10)
    @books = @repo.books.limit(6)
    @subscription_services = @repo.subscription_services.limit(4)
    @blogs = @repo.blogs.limit(4)
    @tips = @repo.tips.limit(4)
    @slides = @repo.slides.limit(4)
    @qnas = @repo.qnas.limit(4)
    @noteworthies = @repo.noteworthies.limit(4)
    @screencasts = @repo.screencasts.limit(4)
  end

  def menu
    menu = [:talks, :blogs, :subscription_services, :screencasts, :slides, :videos, :tips, :qnas, :noteworthies]
    menu.map { |note| note if @repo.send(note).count > 0 }
  end
end
