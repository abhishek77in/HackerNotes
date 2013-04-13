module Plug
  extend ActiveSupport::Concern
  include EmbedlyService

  included do
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Paranoia

    field :title, type: String
    field :description, type: String
    field :url, type: String
    field :html, type: String
    field :height, type: String
    field :width, type: String

    field :thumbnail, type: String
    field :thumbnail_height, type: String
    field :thumbnail_width, type: String

    field :votes, type: Hash, default: -> { Hash.new }

    belongs_to :user
    validates_presence_of :user
    # validates :title, presence: true, on: :create
    # validates :description, presence: true, on: :create
    validates :url, presence: true, uniqueness: true, format: URI::regexp(%w(http https))

    default_scope desc(:created_at)
    before_create :fetch_attributes, unless: Proc.new { self.user.nickname == 'jimmy-thehackernotes' }
    embedded_in :repository
  end

end
