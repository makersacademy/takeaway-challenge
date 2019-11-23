class Menu
  
  attr_reader :menu

  MENU = {
    "Chicken" => 10,
    "Steak" => 15,
    "Pasta" => 8,
    "Pizza" => 9
  }

  def initialize
    @menu = MENU
  end

  def check_menu
    puts "Menu:"
    i = 1
    @menu.each { |meal, price|
      puts "#{i}. #{meal} - £#{price}"
      i += 1
    } 
  end

  def get_price(dish)
    @menu[dish]
  end

end
