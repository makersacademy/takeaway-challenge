class Menu
  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add_dish(dish, price)
    fail 'Dish already in the list!' if dishes.key?(dish)
    dishes[dish] = price
  end

  def remove_dish(dish)
    fail 'Dish not in the list!' unless dishes.key?(dish)
    dishes.delete(dish)
  end

end
