class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include GithubInteraction

  field :uid
  field :name
  field :nickname
  field :image
  field :total_karma, type: Integer, default: 0

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
    points = calculate_points(purpose, resource)
    case purpose
    when :resource
      self.karmas.create({points: points, type: purpose}.merge(resource_details))
    when :vote
      self.karmas.create({points: points, type: purpose}.merge(resource_details))
    end
  end

  def calculate_points(purpose, resource)
    reward_factor = 1
    reward_factor = 2 if resource.repository.owner?(self.nickname)
    case purpose
    when :resource
      return 3 * reward_factor
    when :vote
      return 1 * reward_factor
    end
  end
end
