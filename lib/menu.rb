class Menu
  attr_reader :dishes
  dish_list = [
    carbonara = Dish.new("Carbonara", 7),
    roast_chicken = Dish.new("Roast Chicken", 12),
    risotto = Dish.new("Risotto", 4),
    lasagne = Dish.new("Lasagne", 9),
    burger = Dish.new("Burger", 7),
    steak_pie = Dish.new("Steak Pie", 8),
    lobster = Dish.new("Lobster", 15),
    beluga_caviar = Dish.new("Beluga Caviar", 50)
    ]

  DEFAULT_MENU = dish_list

  def initialize(dishes = DEFAULT_MENU)
    @dishes = dishes
  end

end
