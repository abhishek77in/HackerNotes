module EmbedlyService
  USER_AGENT = 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'

  def fetch_attributes
    embedly_api = Embedly::API.new(user_agent: USER_AGENT, key: ENV['EMBEDLY_API_KEY'])
    embedly_obj = embedly_api.oembed(url: url).first
    # embedly_obj = EmbedlyService.new(self.url)
    self.set_attributes(embedly_obj) unless embedly_obj.nil?
  end

  def set_attributes(embedly_obj)
    self.common_attributes(embedly_obj).each do |attr|
      self[attr] = embedly_obj.send(attr) if embedly_obj.send(attr)
    end
  end

  def common_attributes(embedly_obj)
    self.attribute_names.map(&:to_sym) & embedly_obj.marshal_dump.keys
  end
end
