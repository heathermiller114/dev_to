require 'pry'
class DevTo::Hashtag
  
  attr_accessor :name, :url
  @@all_tags = []
  
  def initialize(name, url)
    @name = name
    @url = url
    @blogposts = []
    @@all_tags << self
  end
  
  def self.all
    @@all_tags
  end
  
  
end