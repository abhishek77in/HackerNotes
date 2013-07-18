class VotesController < RepositoriesBaseController

  def vote
    return unless current_user.present?
    @repo = GithubService.new.fetch(params[:owner], params[:name])
    resource_type = params[:resource_type].underscore.pluralize
    resource = @repo.send(resource_type).where(id: params[:id]).first
    resource.assign_vote(params[:direction], current_user)
    current_user.reward_karma(:vote, resource)
    render :json => resource.votes_count
  end
end
