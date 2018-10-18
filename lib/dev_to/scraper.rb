require 'nokogiri'
require 'open-uri'
require 'pry'

class DevTo::HashtagScraper
  
  def self.tags
    page = Nokogiri::HTML(open("https://dev.to/tags"))
    counter = 0
    while counter < 20
      page.css("a.tag-show-link").each do |hashtag| 
        name = page.css("a.tag-show-link").css("h2")[counter].text
        url = "https://dev.to" + page.css("a.tag-show-link")[counter].attr("href")
        binding.pry
        DevTo::Hashtag.new(name, url)
        counter += 1
      end
    end
  end
  
  def self.scrape_blogs(hashtag_url)
  end
end