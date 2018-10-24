require 'pry'
class DevTo::Blogposts
  
  attr_accessor :title
  @@all_blogposts = []
  
  def initialize(title)
    @title = title
    @@all_blogposts << self
  end
  
  def self.all
    @@all_blogposts
  end
  
  
end