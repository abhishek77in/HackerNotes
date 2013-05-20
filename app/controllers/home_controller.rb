class HomeController < ApplicationController
  def homepage
    @repos = Repository.desc(:created_at).limit(10)
    @popular_repos = Repository.desc(:watchers_count).limit(15)

    @user_repo_names = user_repo_names
  end

  private
  def user_repo_names
    return [] unless current_user
    repos = Rails.cache.fetch(current_user.nickname, :expires_in => 1.weeks) do
      Github.new(basic_auth: "#{ENV['GITHUB_LOGIN']}:#{ENV['GITHUB_PASSWORD']}").repos.list(user: current_user.nickname).map(&:name)
    end
  end
end
