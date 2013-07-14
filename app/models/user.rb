class User
  include Mongoid::Document
  include GithubInteraction

  field :uid, type: String
  field :name, type: String
  field :nickname, type: String
  field :image, type: String
  attr_accessible :uid, :name, :nickname, :image

  def power_user?(repo_owner)
    return true if self.nickname == ENV['JIMMY']
    self.nickname == repo_owner ? true : false
  end

end
