
class DevTo::Blogposts
  
  attr_accessor :title, :url, :related_tags
  @@all_blogposts = []
  
  def initialize(title, url, related_tags)
    @title = title
    @url = url
    @related_tags = related_tags
    @@all_blogposts << self
  end
  
  def self.all
    @@all_blogposts
  end

end