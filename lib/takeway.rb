require './menu'
require './order'

class Takeway
  
  def initialize
    @menu = Menu.new
    @order = Order.new
  end
  
  def print_menu
    @menu.show_menu
  end
  
  def add_to_order(dish, quantity = 1)
    @order.order(dish, quantity)
  end
  
  def print_summary
    @order.show_order
  end
  
  def total_cost
    @order.price
  end
  
end

# y = Takeway.new
# y.print_menu
# y.add_to_order("Fish", 5)
# y.add_to_order("Chicken", 5)
# y.print_summary
# y.total_cost