require_relative 'menu'

class Takeaway
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def read_menu
    @menu.show_menu
  end

  def add_to_order(dish, amount)
    @order.add_product(dish, amount)
  end

  def check_total
    @order.total
  end
end
