class HomeController < ApplicationController
  def homepage
    @repos = Repository.desc(:created_at).limit(10)
    @popular_repos = Repository.desc(:watchers_count).limit(15)
  end
end
