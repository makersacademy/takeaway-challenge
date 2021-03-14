class Menu
  attr_reader :menu
  
  def initialize
    @menu = { "Egg McMuffin" => 2.50, 
             "Hash Brown" => 1 }
  end 

  def see_menu
    puts "McDonalds Breakfast Menu\n------------------------"
    @menu.each { |dish, price| 
      puts "#{dish}.....£#{"%.2f" % price}"
    }
  end

end 
