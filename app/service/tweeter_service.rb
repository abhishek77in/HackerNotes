class TweeterService
  attr_accessor :title, :url, :excerpt, :image

  REQ_URL = "https://twitter.com/search/users?q="
  BASE_URL = "https://twitter.com"

  TWEETER = ".stream-item"
  TITLE = ".fullname"
  URL = "a"
  EXCERPT = ".bio"
  IMAGE = "img"

  def initialize(tweeter)
    @title = tweeter.search(TITLE).text
    @url = BASE_URL + tweeter.search(URL).first["href"]
    @excerpt = tweeter.search(EXCERPT).text
    @image = tweeter.search(IMAGE).first["src"]
  end

  def attributes
    { title: title,
      url: url,
      excerpt: excerpt,
      image: image }
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
