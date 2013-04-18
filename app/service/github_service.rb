class GithubService

  def search(keyword)
    keyword = optimize keyword
    g_repos = Rails.cache.fetch(keyword, :expires_in => 1.weeks) do
      Github.new(basic_auth: "#{ENV['GITHUB_LOGIN']}:#{ENV['GITHUB_PASSWORD']}").search.repos(keyword: keyword)[:repositories]
    end
  end

  def fetch(owner, name)
    find(owner, name) || create(owner, name)
  end

  def find(owner, name)
    Repository.where(owner: owner, name: name).first
  end

  def create(owner, name)
    g_repo = Github.new.repos.get(owner, name)
    Repository.create to_hackernotes(g_repo)
  end

  def optimize(keyword)
    keyword.strip.gsub(/\s*\s/,' ').downcase
  end

  def to_hackernotes(g_repo)
    { name: g_repo.name,
      owner: g_repo.owner.login,
      full_name: g_repo.full_name,
      description: g_repo.description,
      watchers_count: g_repo.watchers,
      forks_count: g_repo.forks }
  end
end
