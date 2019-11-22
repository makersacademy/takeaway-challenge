class Takeaway

  def initialize
    @dishes = [{ dish: "Big Mac", price: "3.19" },
              { dish: "Quarter Pounder", price: "3.19" },
              { dish: "McChicken", price: "3.00" },
              { dish: "Cheeseburger", price: "0.99" },
              { dish: "Hamburger", price: "0.89" },
              { dish: "French Fries", price: "1.09" }]
  end

  def menu
    @dishes.each do |n|
      puts "#{n[:dish]}: £#{n[:price]}"
    end
  end

end
