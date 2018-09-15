class Menu

  attr_reader :dishes

  DISHES = [
    { item: "Beef Burger", price: 7.00 },
    { item: "Ham Burger", price: 8.50 },
    { item: "Cheese Burger", price: 9.25 },
    { item: "French Fries", price: 2.00 },
    { item: "Onion Rings", price: 3.40 }
  ]

  def initialize(dishes = DISHES)
    @dishes = dishes
  end

  def print_menu
    @dishes.each do |dish|
      puts "#{dish[:item]} - £#{sprintf('%.2f',dish[:price])}"
    end
  end

end
