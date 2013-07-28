module Plug
  extend ActiveSupport::Concern
  include EmbedlyService

  included do
    include Mongoid::Document
    include Mongoid::Timestamps
    include Vote

    field :title, type: String
    field :description, type: String
    field :url, type: String
    field :html, type: String
    field :height, type: String
    field :width, type: String

    field :thumbnail_url, type: String
    field :thumbnail_height, type: String
    field :thumbnail_width, type: String

    field :votes, type: Hash, default: -> { Hash.new }
    field :votes_counter, type: Integer, default: 0

    belongs_to :user

    validates_presence_of :user, message: 'Login is required to add resources'
    # validates :title, presence: true, on: :create
    # validates :description, presence: true, on: :create
    validates :url, presence: true, uniqueness: true

    default_scope desc(:votes_counter).where(:votes_counter.gte => -3).order_by(:created_at => :desc)

    before_create :fetch_attributes, if: :media_or_not_jimmy
    before_save :update_votes_count

    embedded_in :repository
  end

  # Attributes should be fetched from Embedly if
  # resource is a media (slides, videos)
  # or if user is not Jimmy
  def media_or_not_jimmy
    return true if ['Video','Slide'].include?(self.model_name)
    self.user.nickname != ENV['JIMMY']
  end
end
