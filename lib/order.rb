require './lib/menu.rb'

class Order

  attr_reader :menu

  # is it worth having menu in a separate module?
  def initialize(menu = Menu::MENU)
    @menu = menu
  end
  
  # this could be its own class/module of format_menu
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