class Repository
  include Mongoid::Document
  include Mongoid::Timestamps

  include Jimmy
  field :name, type: String
  field :owner, type: String
  field :full_name, type: String
  field :description, type: String
  field :watchers, type: Integer
  field :forks, type: Integer
  field :contributors, type: Array

  after_create :create_from_service

  def create_from_service
    [ 
      Thread.new { create_blogs },
      Thread.new { create_slides },
      Thread.new { create_tweeters },
      Thread.new { create_noteworthies },
      Thread.new { create_qnas },
      Thread.new { create_videos }
    ].map(&:join)
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
