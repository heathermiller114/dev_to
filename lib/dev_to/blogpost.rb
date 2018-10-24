require 'pry'
class DevTo::Blogposts
  
  attr_accessor :title, :url
  @@all_blogposts = []
  
  def initialize(title, url)
    @title = title
    @url = url
    @@all_blogposts << self
  end
  
  def self.all
    @@all_blogposts
  end
  
  def self.delete
    @@all_blogposts.clear
  end
end