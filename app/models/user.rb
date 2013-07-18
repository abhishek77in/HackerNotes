class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include GithubInteraction

  field :uid, type: String
  field :name, type: String
  field :nickname, type: String
  field :image, type: String
  field :total_karma, type: Integer

  attr_accessible :uid, :name, :nickname, :image, :total_karma

  embeds_many :karmas

  def power_user?(repo_owner)
    return true if self.nickname == ENV['JIMMY']
    self.nickname == repo_owner ? true : false
  end

  def reward_karma(purpose, resource)
    resource_details = { repository_id: resource.repository.id,
                         resource_id: resource.id,
                         resource_type: resource.class.to_s }
    case purpose
    when :resource
      self.karmas.create({points: 3, type: purpose}.merge(resource_details))
    when :vote
      self.karmas.create({points: 1, type: purpose}.merge(resource_details))
    end
  end
end
