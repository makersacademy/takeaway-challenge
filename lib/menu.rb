class Menu
  attr_reader :food_list

  def initialize
    @food_list = []
  end

  def list
    food =
      { name: "Chicken Satay", price: 6 },
      { name: "Fried Spring Rolls", price: 6 },
      { name: "Green Curry", price: 10 },
      { name: "Salmon Red Curry", price: 12 },
      { name: "Stir Fried Aubergine", price: 8 },
      { name: "Grilled Steak", price: 13 },
      { name: "Egg Fried Rice", price: 2 },
      { name: "Organic Coconut Water", price: 3 }
    @food_list << food
  end
end
