class NotesController < ApplicationController

  def delete
    repo = GithubService.new.fetch(params[:owner], params[:name])
    resource = repo.send(params[:resource]).find(id: params[:id])
    return unless repo.contributors.include?(current_user.nickname)
    resource.destroy
  end
end
