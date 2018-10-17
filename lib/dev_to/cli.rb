class DevTo::CLI
  
  def call
    list_hashtags
    menu
    goodbye
  end
  
  def list_hashtags
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