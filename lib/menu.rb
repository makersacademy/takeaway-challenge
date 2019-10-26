class Menu
  attr_reader :dishes

  def initialize
    @dishes = [{ dish: "Egg fried rice", price: 3 },
      { dish: "Sweet & sour fish", price: 6 },
      { dish: "Morning glory", price: 4 }]
  end

  def view
    @dishes.each do |item|
      puts "#{item[:dish]}: £#{item[:price]}"
    end
  end
end
