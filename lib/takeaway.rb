require_relative 'order'
require_relative 'message'
require_relative 'menu'

class Takeaway

def initialize
  @order = Order.new
  @message = Message.new
  @menu = Menu.new
end

def see_menu
  @menu.view_menu
end

def add_to_order(dish)
  @order.add_item(dish)
  puts "You've added #{@menu.dishes[dish - 1]} to your order"
  @order.current_order
end

end
