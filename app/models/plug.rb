module Plug
  extend ActiveSupport::Concern
  include EmbedlyService

  included do
    include Mongoid::Document
    field :title, type: String
    field :description, type: String
    field :url, type: String
    field :html, type: String
    field :height, type: String
    field :width, type: String

    field :thumbnail, type: String
    field :thumbnail_height, type: String
    field :thumbnail_width, type: String


    belongs_to :user
    validates_presence_of :user
    # validates :title, presence: true, on: :create
    # validates :description, presence: true, on: :create
    validates :url, presence: true, uniqueness: true, format: URI::regexp(%w(http https))

    default_scope limit(10)
    before_create :fetch_attributes, unless: Proc.new { self.repository.new_record? }
    embedded_in :repository
  end

end
