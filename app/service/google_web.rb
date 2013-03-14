class GoogleWeb
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
    noteworthies = Array.new
    Google::Search::Web.new(:query => keyword).each do |site|
      noteworthies << GoogleWeb.new(site) unless site.nil?
    end
    noteworthies
  end

  def strip_tags(html)
    Nokogiri::HTML(html).xpath("//text()").text
  end
end

