class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

end

module ExampleDishes

  DISH_LIST = [
    Dish.new("Carbonara", 7),
    Dish.new("Roast Chicken", 12),
    Dish.new("Risotto", 4),
    Dish.new("Lasagne", 9),
    Dish.new("Burger", 7),
    Dish.new("Steak Pie", 8),
    Dish.new("Lobster", 15),
    Dish.new("Beluga Caviar", 50),
    Dish.new("Delicious Wagyu Kobe Beef with a side of fries", 200)
  ]

end
