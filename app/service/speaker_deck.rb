class SpeakerDeck
  attr_accessor :title, :url, :excerpt, :image

  REQ_URL = "https://speakerdeck.com/search?q="
  BASE_URL = "https://speakerdeck.com"

  SLIDE = ".talk"
  TITLE = "h3"
  URL = "a"
  CREDIT = "p a"
  IMAGE = "img"

  def initialize(slide)
    @title = slide.search(TITLE).first.text
    @url = BASE_URL + slide.search(URL).first["href"]
    credit = slide.search(CREDIT).text
    @excerpt = "#{@title} - by #{credit}"
    @image = slide.search(IMAGE).first["src"]
  end

  def attributes
    { title: sanatize(title),
      url: url,
      excerpt: sanatize(excerpt),
      image: image }
  end

  def self.fetch(keyword)
    agent = Mechanize.new
    slides = Array.new
    page = agent.get(REQ_URL + keyword.gsub(/-|_/,'+'))
    page.search(SLIDE).each do |slide|
      slides << SpeakerDeck.new(slide) if !slide.nil?
    end
    slides
  end

  def sanatize(content)
    content.gsub("\n"," ")
    content.gsub(/\s+/, " ")
  end
end
