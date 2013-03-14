class GoogleVideo
  attr_accessor :title, :url, :excerpt

  def initialize(site)
    @title = site.title
    @url = site.uri
    @excerpt = strip_tags site.content
  end

  def attributes
    { title: title,
      url: url,
      excerpt: excerpt }
  end

  def self.fetch(keyword)
    videos = Array.new
    Google::Search::Video.new(:query => keyword).each do |site|
      videos << GoogleVideo.new(site) unless site.nil?
    end
    videos
  end

  def strip_tags(html)
    Nokogiri::HTML(html).xpath("//text()").text
  end
end
