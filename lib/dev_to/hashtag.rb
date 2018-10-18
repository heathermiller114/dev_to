require 'nokogiri'
require 'open-uri'
require 'pry'

class DevTo::Hashtag
  
  @@all_tags = []
  
  def self.tags
    page = Nokogiri::HTML(open("https://dev.to/tags"))
    counter = 0
    while counter < 20
      page.css("a.tag-show-link").each do |hashtag| 
        name = page.css("a.tag-show-link").css("h2")[counter].text
        url = page.css("a.tag-show-link")[counter].attr("href")
        counter += 1
        binding.pry
      end
    end

  end
  
  def self.all
    self.tags
    @@all_tags
  end
    
  
end