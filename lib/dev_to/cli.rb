class DevTo::CLI
  
  def call
    get_hashtags
    list_hashtags
    menu
  end
  
  def get_hashtags
    puts ""
    puts "------Top Hashtags on DevTo:------"
    puts ""
    DevTo::HashtagScraper.tags
  end
  
  def list_hashtags
    hashtags = DevTo::Hashtag.all
    hashtags[0...20].each.with_index(1) do |tag, index|
      puts "#{index}. #{tag.name}"
    end
  end
    
  def get_blogposts(input)
    DevTo::HashtagScraper.scrape_blogs(input)
    blogposts = DevTo::Blogposts.all
    blogposts[0...8].each.with_index(1) do |post, index|
      puts "#{index}. #{post.title}"
      puts ""
      puts "      Related Hashtags:"
      puts "        #{post.related_tags}"
      puts ""
      puts "      To read online: #{post.url}"
      puts ""
    end
    DevTo::Blogposts.delete
  end
    
  def goodbye
    puts ""
    puts "See you later for new blog posts!"
    puts ""
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the hashtag you would like to see blogposts for, or 'list' to see the hashtag list again or 'exit' if you are done!"
      print "Enter Selection Here: "
      input = gets.strip
        if input.to_i != 0 && input.to_i.between?(1, 20)
          puts ""
          puts "------Here are the most recent blog posts for that hashtag:------"
          puts ""
          get_blogposts(input)
        elsif input.to_i > 20
          puts ""
          puts "Try again!"
          puts ""
        elsif input.downcase == "list"
          list_hashtags
        elsif input.downcase == "exit"
          goodbye
        else 
          puts ""
          puts "Not sure what you are trying to do."
          puts ""
        end
      end
  end

  
end