class NotesController < RepositoriesBaseController

  def resource_iframe
    repo = find_repo(params)
    resource = repo.send(params[:resource]).where(id: params[:id]).first
    render :text => resource.html
  end
end
