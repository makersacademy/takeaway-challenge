#require 'menu'
class Takeaway

attr_reader :menu
attr_reader :order

def initialize
@menu = Menu.new
@order = Order.new
end


def print_menu
  @menu.menu
end

def add_to_basket(item, quantity = 1)
  @order.add_items(item, quantity)
end

def order_summary
@order.basket_contents
end

def order_total
@order.basket_total
end

end
