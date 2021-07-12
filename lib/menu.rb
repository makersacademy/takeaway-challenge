class Menu

  attr_reader :menu

  MENU = { burger: 2.99, fries: 0.99, salad: 1.45, hotdog: 2.25, curry: 2.55 }

  def initialize
    @menu = MENU
  end
 
  def display_menu
    puts "Today's menu:\n\n"
    MENU.each do |key, val|
      puts "#{key} : £#{val}"
    end
  end

end
