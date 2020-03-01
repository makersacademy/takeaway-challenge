require_relative './menu'

class Takeaway
  attr_reader :current_order, :menu
  def initialize(menu = Menu.new)
    @menu = menu
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
