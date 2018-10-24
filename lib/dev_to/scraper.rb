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
        DevTo::Hashtag.new(name, url)
        counter += 1
      end
    end
  end
  
  def self.scrape_blogs(input)
    blogposts = []
    DevTo::Hashtag.all

    
    url = DevTo::Hashtag.all[input.to_i - 1].url
    page = Nokogiri::HTML(open(url))
    counter = 0   
      page.css("h3").each do |article_title|
        title = page.css("h3")[counter].text.strip
        url = "https://dev.to" + page.css("a.index-article-link")[counter].attr("href")
        DevTo::Blogposts.new(title, url)
        counter += 1
      end
  end
end