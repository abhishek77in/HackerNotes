class RemoveController < RepositoriesBaseController

  def remove
    return unless current_user.present?
    repo = find_repo(params)
    return unless current_user.power_user?(repo.owner)
    resource_type = params[:resource_type].underscore.pluralize
    repo.send(resource_type).where(id: params[:id]).first.delete
    render :text => 'removed'
  end
end
