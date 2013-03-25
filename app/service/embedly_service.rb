class EmbedlyService
  USER_AGENT = 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'

  def initialize(url)
    embedly_api = Embedly::API.new(user_agent: USER_AGENT, key: ENV['EMBEDLY_API_KEY'])
    embedly_obj = embedly_api.oembed(url: url).first
  end
end
