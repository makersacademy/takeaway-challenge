class Takeaway
  
  ERR_INVALID_ORDER = 'The selected dish is not on the menu'
  
  def initialize(menu, order)
    @menu = menu
    @order = order.new menu
  end
  
  def print_menu
    menu.read_menu
  end
  
  def select_dish(dish, qty = 1)
    raise ERR_INVALID_ORDER unless menu.contains? dish
    order.add(dish, qty)
  end
  
  def unselect_dish(dish)
    order.remove(dish)
  end
  
  def total
    order.total
  end
  
  private
    attr_reader :menu, :order
end