require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def see_menu
    @menu = Menu.new
    @menu.print
  end

  def add_to_order(dish, quantity = 1)
    @order = Order.new
    @order.add(dish, quantity)
  end

# What do we want to happen?

# When we add an order, we want to call the Order class.
# We cant to add each item and its quantity to an array
# in the order class

end
