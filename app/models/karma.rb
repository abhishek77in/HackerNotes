class Karma
  include Mongoid::Document
  include Mongoid::Timestamps

  field :points, type: Integer
  field :type # 'vote' or 'resource'
  field :repository_id
  field :resource_id
  field :resource_type

  # before_save :update_total_karma
  embedded_in :user

  # def update_total_karma
  # end
end
