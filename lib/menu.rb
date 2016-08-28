class Menu

  attr_reader :dishes

  def initialize
    @dishes = [{name: "Chicken Fillet Burger", price: 2.50}, {name: "Buffalo Wings", price: 3.00}, {name: "Tower Burger Meal", price: 4.00}]
  end

end
