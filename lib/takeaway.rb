require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize(menu=Menu.new, order_class=Order)
    @menu = menu
    @order_class = order_class
  end

  def read_menu
    @menu.read
  end

  def new_order
    @this_order ||= @order_class.new
  end

  def add_to_order(dish)
    @this_order.add(dish)
  end

end
