class GoogleBlog
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
    blogs = Array.new
    Google::Search::Blog.new(:query => keyword).each do |site|
      blogs << GoogleBlog.new(site)
    end
    blogs
  end

  def strip_tags(html)
    Nokogiri::HTML(html).xpath("//text()").text
  end
end
