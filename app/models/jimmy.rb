module Jimmy
  def jimmy
    @jimmy = User.where(nickname: ENV['JIMMY']).first if @jimmy.nil?
    @jimmy
  end

  def add_to_db(resources, resource_type)
    # Optimize later 
    # resources = resources.map { |r| r.attributes.merge(user: @jimmy) }
    # self.send(resource_type).collection.insert(resources)
    resources.each do |resource|
      self.send(resource_type).create(resource.attributes.merge(user: jimmy))
    end
  end

  def create_videos
    return if self.watchers_count < MIN_WATCHERS_COUNT_VIDEOS
    keyword = self.name.to_a + self.description.split(' ').take(4)
    keyword = keyword.join(' ')
    resources = GoogleVideo.fetch(keyword)
    add_to_db(resources, :videos)
  end

  def create_qnas
    return if self.watchers_count < MIN_WATCHERS_COUNT_FAQ
    resources = Stackoverflow.fetch(self.name)
    add_to_db(resources, :qnas)
  end

  def create_noteworthies
    return if self.watchers_count < MIN_WATCHERS_COUNT_NOTEWORTHY
    keyword = self.name.to_a + self.description.split(' ').take(8)
    keyword = keyword.join(' ')
    resources = GoogleWeb.fetch(keyword)
    add_to_db(resources, :noteworthies)
  end

  def create_slides
    return if self.watchers_count < MIN_WATCHERS_COUNT_SLIDES
    keyword = self.name.gsub(/_|-/,' ')
    resources = SpeakerDeck.fetch(keyword)
    add_to_db(resources, :slides)
  end

  def create_blogs
    return if self.watchers_count < MIN_WATCHERS_COUNT_BLOGS
    keyword = self.name.to_a + self.description.split(' ').take(8)
    keyword = keyword.join(' ')
    resources = GoogleBlog.fetch(keyword)
    add_to_db(resources, :blogs)
  end

  def create_tweeters
    return if self.watchers_count < MIN_WATCHERS_COUNT_TWEETERS
    keyword = self.name.gsub(/_|-/,' ')
    resources = TweeterService.fetch(keyword)
    add_to_db(resources, :tweeters)
  end
end
