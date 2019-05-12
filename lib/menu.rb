class Menu
  attr_reader :menu

  MENU = { "spaghetti bolognese" => 4.55, "ham and cheese pancake" => 3.75,
        "double-cheeseburger" => 4.25, "curly fries" => 1.75
        }

  def initialize
    @menu = MENU
  end

  def prices
    @menu.each { |dish, price| puts "#{dish}: £#{price}" }
  end
end
