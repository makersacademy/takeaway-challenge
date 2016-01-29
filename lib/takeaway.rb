class Takeaway
  
  def menu
    puts "What cuisine would you like?"
    puts "1 - Italian"
    puts "2 - Mexican"
    puts "3 - Indian"
    get_choice
  end
  
  def get_choice
   action = gets.chomp
  end
  
  
end