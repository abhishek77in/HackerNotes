class Blog
  include Mongoid::Document
  field :title, type: String
  field :excerpt, type: String
  field :url, type: String

  validates :title, presence: true
  validates :excerpt, presence: true
  validates :url, presence: true, uniqueness: true, format: URI::regexp(%w(http https))

  embedded_in :repository
end
