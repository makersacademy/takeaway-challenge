class Menu

  MENU = { burger: 2.99, fries: 0.99, salad: 1.45, hotdog: 2.00,  curry: 2.50 }
 
  def display_menu
    puts "Today's menu:\n\n"
    MENU.each do | key, val |
      puts "#{key} : £#{val}"
    end
  end

end
