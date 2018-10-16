class Menu
  attr_reader :dishes
  
  def initialize
    @dishes = [
      { dish: "Fish", price: 1 },
      { dish: "Chicken nuggets", price: 2 },
      { dish: "Roast Chicken", price: 5 },
      { dish: "Chicken Burger", price: 2 },
      { dish: "BBQ Chicken", price: 3 },
      { dish: "Fried Chicken", price: 1 },
    ]
  end
  
  def list
    @dishes.each_with_index { |dish, index|
      puts "#{index + 1}. #{dish[:dish]} £#{dish[:price]}"
    }
  end
end
