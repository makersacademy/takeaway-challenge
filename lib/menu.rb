class Menu
  attr_reader :dishes

  def initialize
    @dishes = [
      { dish_name: "Mushroom Risotto", price: 8 }, 
      { dish_name: "Pepperoni Pizza", price: 4 },
      { dish_name: "Cheeseburger", price: 5 },
      { dish_name: "Prawn Noodles", price: 8 },
      { dish_name: "Chicken Tikka", price: 6 }
    ]
  end

  def print_available_dishes
    @dishes.each do |dish|
      puts "#{dish[:dish_name]}: £#{dish[:price]}"
    end
  end
end
