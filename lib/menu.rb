class Menu
  def initialize
    @dishes = Hash.new(0)
  end

  def add(dish, price)
    @dishes[dish] = price
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
end
