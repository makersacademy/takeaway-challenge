require_relative 'menu'
require_relative 'order'

class Takeaway  
  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def show_menu
    @menu.show
  end

  def add_to_order(dish)
    @order.add(dish)
  end

  def show_order
    @order.current_order
  end
end
