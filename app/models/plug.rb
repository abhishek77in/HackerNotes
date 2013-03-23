module Plug
  extend ActiveSupport::Concern

  included do
    include Mongoid::Document
    field :title, type: String
    field :description, type: String
    field :url, type: String
    field :thumbnail, type: String

    belongs_to :user
    # validates :title, presence: true
    validates :url, presence: true, uniqueness: true, format: URI::regexp(%w(http https))

    # index :url, unique: true, background: true
    default_scope limit(10)
    # before_create :fetch_attributes
    embedded_in :repository
  end

  # def fetch_attributes
  #   #call embed.ly api and set attributes
  #   self.url 
  # end
end
