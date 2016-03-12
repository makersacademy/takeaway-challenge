class Menu

  def initialize
    @menu = {}
  end

  def display
    @menu.dup
  end

  def upload(menu)
    @menu = menu
  end

  def add(dish, price)
    @menu[dish] = price
  end

  def remove(dish)
    @menu.delete(dish)
  end
end
