class Stackoverflow
  attr_accessor :title, :url, :description

  REQ_URL = "http://stackoverflow.com/search?tab=votes&q="
  BASE_URL = "http://stackoverflow.com"

  QA = ".search-result"
  TITLE = ".result-link span"
  URL = ".result-link span a"
  DESCRIPTION = ".excerpt"

  def initialize(qa)
    @title = qa.search(TITLE).text
    @url = BASE_URL + qa.search(URL).first["href"]
    @description = qa.search(DESCRIPTION).text
  end

  def attributes
    { title: title,
      url: url,
      description: description }
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
