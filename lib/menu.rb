class Menu

  attr_accessor :dishes

  DISHES = {
    "Beef Burger" => 7.00,
    "Ham Burger" => 8.50,
    "Cheese Burger" => 9.25,
    "French Fries" => 2.00,
    "Onion Rings" => 3.40
  }

  def initialize(dishes = DISHES)
    @dishes = dishes
  end

  def print_menu
    @dishes.each do |dish, price|
      puts "#{dish} - £#{sprintf('%.2f', price)}"
    end
  end

end
