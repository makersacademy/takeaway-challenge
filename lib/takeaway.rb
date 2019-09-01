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

def add_to_basket(item, quantity)
  @order.add_items(item, quantity)
end

end
