class RepositoriesBaseController < ApplicationController
  protected

  def name_from_params(options)
    [options[:name], options[:format]].compact.join('.')
  end

  def find_repo(options)
    owner = options[:owner]
    name  = name_from_params(options)
    GithubService.new.fetch(owner, name)
  end

end
