class Order
  attr_reader :menu, :basket, :dish

  def initialize
    @menu = [
      {dish: "Jasmine Rice", price: 2.50},
      {dish: "Coconut Rice", price: 3.50},
      {dish: "Egg Noodles", price: 4.75},
      {dish: "Egg Fried Rice", price: 3.50},
      {dish: "Chicken Red Thai Curry", price: 4.75},
      {dish: "Pork Green Thai Curry", price: 5.75},
      {dish: "Stir-fry Duck with Ginger", price: 5.75},
      {dish: "Stir-fry Beef with Mushroom", price: 5.75},
      {dish: "Stir-fry Squid with Veg", price: 5.75},
      {dish: "Mixed Seafood", price: 4.75},
      {dish: "Spring Rolls (6)", price: 3.50}
      ]
    @basket = []
  end

  def view_menu
    @menu
  end

  def add(dish_name, quantity, dish = Dish)
    dish_selected = @menu.select { |item| item[:dish] == dish_name}
    @basket << dish.new(dish_name, quantity, dish_selected[0][:price]).add
  end
end
