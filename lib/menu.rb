class Menu

  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add_item(dish, price)
    dishes[dish] = price
  end

  def remove_item(dish)
    dishes.delete(dish)
  end

  def includes?(dish)
    dishes.include?(dish)
  end
end
