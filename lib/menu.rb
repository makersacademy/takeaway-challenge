#Understands how to print a menu

require_relative 'takeaway'

class Menu

  def initialize
    @menu = {"chicken" => 3.50, "burrito" => 4.0, "fish" => 5.0}
  end

  def print_menu
    @menu.each do |food, price|
      puts ("#{food.capitalize} -------- £#{price}").center(20)
    end
  end

  def included?(food)
    @menu.has_key?(food)
  end

  def price_checker
    @menu[food]
  end

end
