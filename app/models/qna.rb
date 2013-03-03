class Qna
  include Mongoid::Document
  field :title, type: String
  field :excerpt, type: String
  field :url, type: String

  validates :title, presence: true
  validates :excerpt, presence: true
  validates :url, presence: true, uniqueness: true, format: URI::regexp(%w(http https))

  default_scope limit(10)

  embedded_in :repository
end
