require_relative 'menu'
require_relative 'order'

class Takeaway

attr_reader :menu, :order

def initialize
  @menu = Menu.new
  @order = Order.new
end

def print_menu
  @menu.menu
end

def add_item(item, quantity)
  @order.add(item, quantity)
end

def view_order
  @order.order_summary
  @order.basket_total
end

def confirm_order
  @message.send_message
  end
end
