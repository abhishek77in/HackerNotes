class SubscriptionService
  include Mongoid::Document
  field :title, type: String
  field :url, type: String
  field :description, type: String

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true, uniqueness: true, format: URI::regexp(%w(http https))

  default_scope limit(10)

  embedded_in :repository
end
