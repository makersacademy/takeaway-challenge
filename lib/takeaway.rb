require_relative './menu'
# inherits the view menu and other menu methods from the menu class
class Takeaway < Menu

  attr_reader :current_order, :menu

# injects new menu object and order object
  def initialize(menu_items = Menu.new, current_order = Order.new)
#assigns the menu instance's menu_items list to an instance variable of takeaway
    @menu_items = menu_items.menu_items
    @current_order = current_order
  end

# method is inherited by Order and used to add dished to current_orders list of items
  def add(dish, amount)
    @current_order.add(dish, amount)
    puts "You have added #{amount} #{dish} to your order"
  end
end

#
# initialize(menu = menu.new)
#  menu = menu
#  current_order
# end
#
# # creates an order
#
# create_order(curent_order = Order.new)
#   current_order
# end
#
# # lets the user select items and add them to an order
#
# add(dish, amount)
#   current_order.add(dish, amount)
# end
#
# checkout(current_order)
#   current_order.checkout(message)
# end
