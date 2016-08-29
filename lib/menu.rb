#Understands how to price food

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

  def price_checker(food)
    @menu[food]
  end

end
