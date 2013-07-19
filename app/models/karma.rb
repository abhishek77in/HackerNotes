class Karma
  include Mongoid::Document
  include Mongoid::Timestamps

  field :points, type: Integer
  field :type # 'vote' or 'resource'
  field :repository_id
  field :resource_id
  field :resource_type

  validates :resource_id, :uniqueness => {:scope => :type}
  validates_presence_of :points, :type, :repository_id, :resource_id, :resource_type

  before_save :update_total_karma
  embedded_in :user

  def update_total_karma
    user.total_karma = user.karmas.map(&:points).reduce(:+)
    user.save
  end
end
