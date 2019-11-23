class Menu
  
  attr_reader :menu

  def initialize
    @menu = [ ["Chicken", 10], ["Steak", 15], ["Pasta", 8], ["Pizza", 9] ]
  end

  def check_menu
    puts "Menu:"
    @menu.each.with_index(1) { | meal, index |
      puts "#{index}. #{meal[0]} - £#{meal[1]}"
  }
    
  end

end