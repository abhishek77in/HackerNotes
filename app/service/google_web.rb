class GoogleWeb
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
    noteworthies = Array.new
    Google::Search::Web.new(:query => keyword).each do |site|
      noteworthies << GoogleWeb.new(site) unless site.nil?
    end
    noteworthies.uniq { |n| n.url }
  end

  def strip_tags(html)
    Nokogiri::HTML(html).xpath("//text()").text
  end
end

