require_relative 'restaurant'

class Menu
  attr_reader :menu_list

  def initialize
    @menu_list = {
      "Cheese Burger" => 5,
      "Bacon Cheese Burger" => 6,
      "Double Cheese Burger" => 7,
      "Classic Fries" => 3,
      "Bacon Fries" => 5,
      "Regular Size Soda" => 2,
      "Ice Cream" => 2,
      "Milkshake" => 3
    }
  end

  def print_menu
    puts "JARA'S TAKEAWAY MENU"
    @menu_list.each do |dish, price|
      puts "#{dish}: £#{price}"
    end
  end
end
