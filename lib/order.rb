require './lib/menu.rb'

class Order

  attr_reader :menu

  def initialize(menu = Menu::MENU)
    @menu = menu
  end
  
  def display_menu
      puts "\n"
      puts "Our Incredible Menu"
      puts "-------------------"
      puts "\n"
    @menu.each { |k, v|
      puts "Dish: #{k}, Price: #{v}"
    }
      puts "\n"

  end

end