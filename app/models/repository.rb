class Repository
  include Mongoid::Document
  include Jimmy
  field :name, type: String
  field :owner, type: String
  field :full_name, type: String
  field :description, type: String
  field :watchers, type: Integer
  field :forks, type: Integer

  after_create :create_from_service

  def create_from_service
    create_blogs
    create_slides
    create_tweeters
    create_noteworthies
    create_qnas
    create_videos
  end

  embeds_many :videos
  embeds_many :tweeters
  embeds_many :subscription_services
  embeds_many :blogs
  embeds_many :tips
  embeds_many :slides
  embeds_many :qnas
  embeds_many :books
  embeds_many :noteworthies
  embeds_many :screencasts
end
