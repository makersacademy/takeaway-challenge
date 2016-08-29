#Understands how to print a menu

require_relative 'takeaway'

class Menu

  def initialize
    @menu = {"chicken" => 3.50, "burrito" => 4.0, "fish" => 5.0}
  end

  def print_menu
    @menu.each do |food, price|
      puts "#{food.capitalize} -------- £#{price}"
    end
  end

end
