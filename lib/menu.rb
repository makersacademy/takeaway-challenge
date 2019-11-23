class Menu
  
  def initialize
    @dishes = [{ name: "Big Mac", price: "3.19" },
              { name: "Quarter Pounder", price: "3.19" },
              { name: "McChicken", price: "3.00" },
              { name: "Cheeseburger", price: "0.99" },
              { name: "Hamburger", price: "0.89" },
              { name: "French Fries", price: "1.09" }]
  end

  def show
    @dishes.each_with_index do |dish, i|
      puts "#{i}. #{dish[:name]}: £#{dish[:price]}"
    end
  end

end
