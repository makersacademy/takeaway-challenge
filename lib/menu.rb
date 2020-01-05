class Menu
  DISHES = {
      1 => { dish: "Egg fried rice", price: 3 },
      2 => { dish: "Sweet & sour fish", price: 6 },
      3 => { dish: "Morning glory", price: 4 }
      }

  attr_reader :dishes

  def initialize(dishes = DISHES)
    @dishes = dishes
  end

  def view
    dishes.each do |num, item|
      puts "#{num}. #{item[:dish]}: £#{item[:price]}"
    end
  end
end
