class Stackoverflow
  attr_accessor :title, :url, :excerpt

  REQ_URL = "http://stackoverflow.com/search?tab=votes&q="
  BASE_URL = "http://stackoverflow.com"

  QA = ".search-result"
  TITLE = ".result-link span"
  URL = ".result-link span a"
  EXCERPT = ".excerpt"

  def initialize(qa)
    @title = qa.search(TITLE).text
    @url = BASE_URL + qa.search(URL).first["href"]
    @excerpt = qa.search(EXCERPT).text
  end

  def attributes
    { title: title,
      url: url,
      excerpt: excerpt }
  end

  def self.fetch(keyword)
    agent = Mechanize.new
    page = agent.get(REQ_URL + keyword)
    qnas = Array.new
    page.search(QA).each do |qa|
      qnas << Stackoverflow.new(qa) unless qa.nil?
    end
    qnas
  end

end
