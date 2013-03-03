class SubscriptionService
  include Mongoid::Document
  field :title, type: String
  field :url, type: String
  field :description, type: String
end
