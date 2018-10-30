
require 'nokogiri'
require 'open-uri'
require 'pry'

class DevTo::HashtagScraper
  
  def self.tags
    page = Nokogiri::HTML(open("https://dev.to/tags"))

    page.css("a.tag-show-link").each do |hashtag| 
      name = hashtag.children.css('h2').text
      url = "https://dev.to" + hashtag.attr('href')
      DevTo::Hashtag.new(name, url)
    end
  end
  
  def self.scrape_blogs(input)

    url = DevTo::Hashtag.all[input.to_i - 1].url
    page = Nokogiri::HTML(open(url))

    counter = 0   
      
    page.css("a.index-article-link").each do |article|
      title = article.children[1].children.text.strip
      url = "https://dev.to" + article.attr("href")
      related_tags = page.css("div.tags")[counter].text.strip
      DevTo::Hashtag.all[input.to_i - 1].blogposts << DevTo::Blogposts.new(title, url, related_tags)
      counter += 1
    end
  end
end

#title = page.css("div.single-article.single-article-small-pic").css("h3").children.first.text.strip
#tags = page.css("div.single-article.single-article-small-pic").css("div.tags").first.children.text.strip
#url = page.css("div.single-article.single-article-small-pic").css("a")[1].attr("href")