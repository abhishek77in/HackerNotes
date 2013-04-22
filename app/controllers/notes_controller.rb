class NotesController < ApplicationController

  def resource_iframe
    repo = GithubService.new.fetch(params[:owner], params[:name])
    resource = repo.send(params[:resource]).where(id: params[:id]).first
    render :text => resource.html
  end
end
