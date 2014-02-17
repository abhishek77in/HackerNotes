class TweeterService
  attr_accessor :title, :url, :description, :thumbnail_url

  REQ_URL = "https://twitter.com/search/users?q="
  BASE_URL = "https://twitter.com"

  TWEETER = ".stream-item"
  TITLE = ".fullname"
  URL = "a"
  DESCRIPTION = ".bio"
  IMAGE = "img"

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = TWITTER_CONSUMER_KEY
      config.consumer_secret     = TWITTER_SECRET_KEY
      config.access_token        = TWITTER_ACCESS_TOKEN
      config.access_token_secret = TWITTER_ACCESS_TOKEN_SECRET
    end
  end

  def initialize(tweeter)
    @title = tweeter.search(TITLE).text
    @url = BASE_URL + tweeter.search(URL).first["href"]
    @description = tweeter.search(DESCRIPTION).text
    @thumbnail_url = tweeter.search(IMAGE).first["src"]
  end

  def attributes
    { title: title,
      url: url,
      description: description,
      thumbnail_url: thumbnail_url }
  end

  def self.fetch(keyword)
    agent = Mechanize.new
    page = agent.get(REQ_URL + keyword)
    tweeters = Array.new
    page.search(TWEETER).each do |tweeter|
      tweeters << TweeterService.new(tweeter) unless tweeter.nil?
    end
    tweeters
  end

end
