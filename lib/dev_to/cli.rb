class DevTo::CLI
  
  def call
    list_hashtags
    menu
    goodbye
  end
  
  def list_hashtags
    puts "Top Hashtags on DevTo:"
    @hashtag = DevTo::Hashtag.tags
    @hashtag.each.with_index(1) do |tag, index|
      puts "#{index}. #{tag}"
    end
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the hashtag you would like to see blogposts for, or 'list' to see the hashtag list again or 'exit' if you are done!"
      input = gets.strip
        if input.to_i != 0 && input.to_i.between?(1, 20)
          puts "Here are the most recent blog posts for that hashtag:"
        elsif input.to_i > 20
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