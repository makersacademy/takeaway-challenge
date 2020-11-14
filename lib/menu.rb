class Menu
  attr_reader :menu

  MENU = { "spaghetti bolognese" => 4.50, "ham and cheese pancake" => 3.70,
        "double-cheeseburger" => 4.40, "curly fries" => 1.50
        }

  def initialize
    @menu = MENU
  end

  def prices
    @menu.each { |dish, price| puts "#{dish}: £#{price}" }
  end
end
