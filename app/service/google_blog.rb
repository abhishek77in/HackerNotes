class GoogleBlog
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
    blogs = Array.new
    Google::Search::Blog.new(:query => keyword).each do |site|
      blogs << GoogleBlog.new(site)
    end
    blogs.uniq { |b| b.url }
  end

  def strip_tags(html)
    Nokogiri::HTML(html).xpath("//text()").text
  end
end
