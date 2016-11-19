#contains a dish list with prices by default, can add a dish and eliminate a dish.
class Menu

  attr_reader :dishes

  def initialize
    @dishes = {chicken: 5, beef: 6, pork: 7}
  end

  def add(dish,price)
    @dishes[dish.to_sym] = price
  end

  def remove_dish(dish)
    @dishes.delete(dish.to_sym)
  end

end
