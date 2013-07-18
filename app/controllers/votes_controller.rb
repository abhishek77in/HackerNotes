class VotesController < RepositoriesBaseController

  def vote
    return unless current_user.present?
    @repo = GithubService.new.fetch(params[:owner], params[:name])

    resource_type = params[:resource_type].underscore.pluralize
    resource = @repo.send(resource_type).where(id: params[:id]).first

    current_user.reward_karma(:vote, resource) if resource.first_vote?(current_user.nickname)
    resource.assign_vote(params[:direction], current_user)

    render :json => resource.votes_count
  end
end
