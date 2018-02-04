class Menu

  attr_reader :dishes

  DISHES = { "Prawn Toast" => 2.50,
    "Spring Rolls" => 2.00,
    "Chicken Chow Mein" => 5.50,
    "Sweet and Sour Pork" => 6.00,
    "Vegetable Curry" => 5.00,
    "Fried Rice" => 3.50
  }

  def initialize(dishes = DISHES)
    @dishes = dishes
  end

  def print
    puts "Menu"
    puts "----------"
    dishes.each do |dish, price|
      puts "#{dish}: £#{sprintf('%.2f', price)}"
    end
  end

end
