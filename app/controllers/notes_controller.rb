class NotesController < ApplicationController

  def delete
    repo = GithubService.new.fetch(params[:owner], params[:name])
    resource = repo.send(params[:resource]).find(id: params[:id])
    return unless current_user.nickname == repo.owner
    resource.destroy
  end
end
