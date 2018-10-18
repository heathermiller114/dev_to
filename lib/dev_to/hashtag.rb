require 'pry'
class DevTo::Hashtag
  
  attr_accessor :name, :url
  @@all_tags = []
  
  def self.tags
    puts "Here are the top 20 hashtags on DevTo"
    puts "1. Javascript"
    puts "2. Discuss"
    puts "3. WebDev"
    puts "4. Beginners"
    puts "5. React"
    puts "6. Career"
    puts "7. OpenSource"
    puts "8. Productivity"
    puts "9. Node"
    puts "10. CSS"
    puts "11. Python"
    puts "12. Help"
    puts "13. DevOps"
    puts "14. ShowDev"
    puts "15. Testing"
    puts "16. Java"
    puts "17. Programming"
    puts "18. Git"
    puts "19. PHP"
    puts "20. Ruby"
    
    
    hashtag_1 = self.new
    hashtag_1.name = "Javascript"
    hashtag_1.url = "https://dev.to/t/javascript"
    @@all_tags << hashtag_1

    hashtag_2 = self.new
    hashtag_2.name = "Discuss"
    hashtag_2.url = "https://dev.to/t/discuss"
    @@all_tags << hashtag_2
    
    hashtag_3 = self.new
    hashtag_3.name = "WebDev"
    hashtag_3.url = "https://dev.to/t/webdev"
    @@all_tags << hashtag_3

  end
  
  
end