module Jimmy
  def create_videos
    keyword = self.name.to_a + self.description.split(' ').take(4)
    keyword = keyword.join(' ')
    resources = GoogleVideo.fetch(keyword)
    resources.each do |resource|
      self.videos.create(resource.attributes)
    end
  end

  def create_qnas
    resources = Stackoverflow.fetch(self.name)
    resources.each do |resource|
      self.qnas.create(resource.attributes)
    end
  end

  def create_noteworthies
    keyword = self.name.to_a + self.description.split(' ').take(8)
    keyword = keyword.join(' ')
    resources = GoogleWeb.fetch(keyword)
    resources.each do |resource|
      self.noteworthies.create(resource.attributes)
    end
  end

  def create_slides
    keyword = self.name.gsub(/_|-/,' ')
    slides = SpeakerDeck.fetch(keyword)
    slides.each do |slide|
      self.slides.create(slide.attributes)
    end
  end

  def create_blogs
    keyword = self.name.to_a + self.description.split(' ').take(8)
    keyword = keyword.join(' ')
    blogs = GoogleBlog.fetch(keyword)
    blogs.each do |blog|
      self.blogs.create(blog.attributes)
    end
  end

  def create_tweeters
    keyword = self.name.gsub(/_|-/,' ')
    TweeterService.fetch(keyword).each do |t|
      self.tweeters.create(t.attributes)
    end
  end
end
