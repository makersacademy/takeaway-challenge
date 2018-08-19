class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

end

module ExampleDishes

  DISH_LIST = [ 
    carbonara = Dish.new("Carbonara", 7),
    roast_chicken = Dish.new("Roast Chicken", 12),
    risotto = Dish.new("Risotto", 4),
    lasagne = Dish.new("Lasagne", 9),
    burger = Dish.new("Burger", 7),
    steak_pie = Dish.new("Steak Pie", 8),
    lobster = Dish.new("Lobster", 15),
    beluga_caviar = Dish.new("Beluga Caviar", 50),
    kobe_beef = Dish.new("Delicious Wagyu Kobe Beef with a side of fries", 200)
  ]

end