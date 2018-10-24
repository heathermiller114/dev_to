class DevTo::CLI
  
  def call
    get_hashtags
    list_hashtags
    menu
    goodbye
  end
  
  def get_hashtags
    puts "Top Hashtags on DevTo:"
    DevTo::HashtagScraper.tags
  end
  
  def list_hashtags
    hashtag = DevTo::Hashtag.all
    hashtag.each.with_index(1) do |tag, index|
      puts "#{index}. #{tag.name}"
    end
  end
    
  def get_blogposts(input)
    DevTo::HashtagScraper.scrape_blogs(input)
    blogposts = DevTo::Blogposts.all
    blogposts.each.with_index(1) do |post, index|
      puts "#{index}. #{post.title}"
    end
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the hashtag you would like to see blogposts for, or 'list' to see the hashtag list again or 'exit' if you are done!"
      input = gets.strip
        if input.to_i != 0 && input.to_i.between?(1, 100)
          puts "Here are the most recent blog posts for that hashtag:"
          get_blogposts(input)
        elsif input.to_i > 100
          puts "Try again!"
        elsif input.downcase == "list"
          list_hashtags
        else 
          puts "Not sure what you are trying to do. Enter 'list' for the list of hashtags, or 'exit'."
        end
      end
  end

  
  def goodbye
    puts "See you later for new blog posts!"
  end
  
end