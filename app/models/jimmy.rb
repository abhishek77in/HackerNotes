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
    keyword = self.name.to_a + self.description.split(' ').take(4)
    keyword = keyword.join(' ')
    resources = GoogleVideo.fetch(keyword)
    add_to_db(resources, :videos)
  end

  def create_qnas
    resources = Stackoverflow.fetch(self.name)
    add_to_db(resources, :qnas)
  end

  def create_noteworthies
    keyword = self.name.to_a + self.description.split(' ').take(8)
    keyword = keyword.join(' ')
    resources = GoogleWeb.fetch(keyword)
    add_to_db(resources, :noteworthies)
  end

  def create_slides
    keyword = self.name.gsub(/_|-/,' ')
    resources = SpeakerDeck.fetch(keyword)
    add_to_db(resources, :slides)
  end

  def create_blogs
    keyword = self.name.to_a + self.description.split(' ').take(8)
    keyword = keyword.join(' ')
    resources = GoogleBlog.fetch(keyword)
    add_to_db(resources, :blogs)
  end

  def create_tweeters
    keyword = self.name.gsub(/_|-/,' ')
    resources = TweeterService.fetch(keyword)
    add_to_db(resources, :tweeters)
  end
end
