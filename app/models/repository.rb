class Repository
  include Mongoid::Document
  field :name, type: String
  field :owner, type: String
  field :full_name, type: String
  field :description, type: String
  field :watchers, type: Integer
  field :forks, type: Integer

  after_create :create_from_service

  def create_from_service
    create_blogs_from_service
    create_slides_from_service
    create_tweeters_from_service
    create_noteworthies_from_service
    create_qnas_from_service
    create_videos_from_service
  end

  def create_videos_from_service
    keyword = self.name.to_a + self.description.split(' ').take(8)
    keyword = keyword.join(' ')
    resources = GoogleVideo.fetch(keyword)
    resources.each do |resource|
      self.videos.create(resource.attributes)
    end
  end

  def create_qnas_from_service
    resources = Stackoverflow.fetch(self.name)
    resources.each do |resource|
      self.qnas.create(resource.attributes)
    end
  end

  def create_noteworthies_from_service
    keyword = self.name.to_a + self.description.split(' ').take(8)
    keyword = keyword.join(' ')
    resources = GoogleWeb.fetch(keyword)
    resources.each do |resource|
      self.noteworthies.create(resource.attributes)
    end
  end

  def create_slides_from_service
    keyword = self.name.gsub(/_|-/,' ')
    slides = SpeakerDeck.fetch(keyword)
    slides.each do |slide|
      self.slides.create(slide.attributes)
    end
  end

  def create_blogs_from_service
    keyword = self.name.to_a + self.description.split(' ').take(8)
    keyword = keyword.join(' ')
    blogs = GoogleBlog.fetch(keyword)
    blogs.each do |blog|
      self.blogs.create(blog.attributes)
    end
  end

  def create_tweeters_from_service
    keyword = self.name.gsub(/_|-/,' ')
    TweeterService.fetch(keyword).each do |t|
      self.tweeters.create(t.attributes)
    end
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
