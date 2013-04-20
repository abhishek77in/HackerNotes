class VotesController < ApplicationController

  def vote
    return unless current_user.present?
    repo = GithubService.new.fetch(params[:owner], params[:name])
    resource = @repo.send(params[:resource]).find(id: params[:id])
    resource.assign_vote(params[:direction], current_user)
    return resource.votes_count
  end
end
