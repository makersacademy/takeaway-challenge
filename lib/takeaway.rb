require_relative 'menu'

class Takeaway
  def initialize(menu)
    @menu = menu
  end

  def read_menu
    @menu.show_menu
  end

  def order(dish, amount)
    @menu.select_dish(dish)
  end

end
