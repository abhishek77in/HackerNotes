class Repository
  include Mongoid::Document
  include Mongoid::Timestamps

  include Jimmy
  field :name
  field :owner
  field :full_name
  field :description
  field :watchers_count, type: Integer
  field :forks_count, type: Integer

  validates :name, :uniqueness => {:scope => :owner}

  after_create :create_from_service

  def create_from_service
    delay.create_blogs
    delay.create_slides
    # delay.create_tweeters
    delay.create_noteworthies
    delay.create_qnas
  end

  def owner?(user_name)
    owner == user_name
  end

  embeds_many :tweeters
  embeds_many :subscription_services
  embeds_many :blogs
  embeds_many :tips
  embeds_many :slides
  embeds_many :qnas
  embeds_many :books
  embeds_many :noteworthies
  embeds_many :screencasts
  embeds_many :talks
  embeds_many :tutorials
  embeds_many :examples
end
