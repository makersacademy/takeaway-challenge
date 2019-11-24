class Menu
  attr_reader :dishes, :basket_sum

  def initialize
    @basket_sum = 0
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

  def available?(item)
    @dishes.any? { |dish| dish[:name] == item }
  end

  def cost(item, quantity)
    quantity * find(item)[:price].to_f
  end

  def sum(basket)
    basket.each { |item, quantity| @basket_sum += cost(item, quantity) }
  end

  def find(item)
    @dishes.find { |x| x[:name] == item }
  end

end
