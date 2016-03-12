class Menu
  def initialize
    @dishes = {}
  end

  def add(dish, price)
    @dishes[dish.to_sym] = price
  end

  def remove(dish)
    @dishes.delete(dish)
  end

  def load_menu(menu)
    @dishes = menu
  end

  def display
    @dishes
  end

  def contains?(item)
    @dishes.include?(item.to_sym)
  end

  def price(item)
    @dishes[item.to_sym]
  end
end
