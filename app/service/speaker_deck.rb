class SpeakerDeck
  attr_accessor :title, :url, :description, :thumbnail_url

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
    @description = "#{@title} - by #{credit}"
    @thumbnail_url = slide.search(IMAGE).first["src"]
  end

  def attributes
    { title: sanatize(title),
      url: url,
      description: sanatize(description),
      thumbnail_url: thumbnail_url }
  end

  def self.fetch(keyword)
    agent = Mechanize.new
    slides = Array.new
    page = agent.get(REQ_URL + keyword.gsub(/-|_/,'+'))
    page.search(SLIDE).each do |slide|
      next if (slide.nil? || slide.search(TITLE).first.nil?)
      slides << SpeakerDeck.new(slide)
    end
    slides
  end

  def sanatize(content)
    content.gsub("\n"," ")
    content.gsub(/\s+/, " ")
  end
end
