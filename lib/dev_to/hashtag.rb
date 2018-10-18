require 'nokogiri'
require 'open-uri'
require 'pry'

class DevTo::Hashtag
  
  attr_accessor :name, :url
  @@all_tags = []
  
  def self.tags
    page = Nokogiri::HTML(open("https://dev.to/tags"))
    counter = 1
    while counter <= 20
      page.css("a.tag-show-link").css("h2").collect do |name| 
        @@all_tags << name.text
        counter += 1
      end
    end
    binding.pry
    @@all_tags

  end
  
end