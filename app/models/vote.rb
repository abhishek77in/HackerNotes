class Vote
  include Mongoid::Document

  field :type, type: String
  field :type_id, type: String
  field :value, type: Integer

  belongs_to :user
end
