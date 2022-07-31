class Dish

  attr_reader :dish, :price
  attr_reader :dish_for_menu

  def initialize(dish, price)
    @dish = dish
    @price = price
    @dish_for_menu
  end

  def dish_for_menu
    @dish_for_menu = { dish: dish, price: price }
  end

end
