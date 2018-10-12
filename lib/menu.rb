class Menu
  attr_reader :dishes
  
  def initialize
    @dishes = [
      { dish: "Fish", price: 1 },
      { dish: "Chicken", price: 2 }
    ]
  end
  
  def list
    @dishes.each_with_index { |dish, index|
      puts "#{index + 1}. #{dish[:dish]} £#{dish[:price]}"
    }
  end
end
