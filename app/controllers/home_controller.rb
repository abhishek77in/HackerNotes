class HomeController < ApplicationController
  def homepage
    @repos = Repository.desc(:created_at).limit(15)
    @popular_repos = Repository.desc(:watchers_count).limit(10)
  end
end
