class HomeController < ApplicationController
  def homepage
    @repos = Repository.limit(30)
  end
end
