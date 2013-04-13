class VotesController < ApplicationController

  def vote
    return unless current_user.present?
    repo = GithubService.new.fetch(params[:owner], params[:name])
    resource = @repo.send(params[:resource]).find(id: params[:id])
    assign_vote(resource, params[:direction])
    return votes_count(resource)
  end

  private
  def assign_vote(resource, direction)
    if params[direction] == :up
      resource.votes[current_user.nickname] = 1
    elsif params[direction] == :down
      resource.votes[current_user.nickname] = -1
    end
    resource.save
  end

  def votes_count(resource)
    resource.votes.values.sum
  end
end
