class GoogleVideo
  attr_accessor :title, :url, :description

  def initialize(site)
    @title = site.title
    @url = site.uri
    @description = strip_tags site.content
  end

  def attributes
    { title: title,
      url: url,
      description: description }
  end

  def self.fetch(keyword)
    videos = Array.new
    Google::Search::Video.new(:query => keyword).each do |site|
      videos << GoogleVideo.new(site) unless site.nil?
    end
    videos.uniq { |v| v.url }
  end

  def strip_tags(html)
    Nokogiri::HTML(html).xpath("//text()").text
  end
end
