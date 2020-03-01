require_relative './menu'
# inherits the view menu and other menu methods from the menu class
class Takeaway < Menu

  attr_reader :current_order, :menu

# injects new menu object 
  def initialize(menu_items = Menu.new)
    @menu_items = menu_items.menu_items
    @current_order
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
