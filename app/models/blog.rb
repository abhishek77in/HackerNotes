class Blog
  include Mongoid::Document
  field :name, type: String
  field :excerpt, type: String
  field :url, type: String

  validates :name, presence: true
  validates :excerpt, presence: true
  validates :url, presence: true, uniqueness: true, format: URI::regexp(%w(http https))
end
