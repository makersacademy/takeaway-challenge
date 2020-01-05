class Menu

  attr_reader :dishes

  DISHES = [{ dish: "Egg fried rice", price: 3 },
      { dish: "Sweet & sour fish", price: 6 },
      { dish: "Morning glory", price: 4 }]

  def initialize(dishes = DISHES)
    @dishes = dishes
  end

  def view
    n = 1
    @dishes.each do |item|
      puts "#{n}. #{item[:dish]}: £#{item[:price]}"
      n += 1
    end
  end
end
