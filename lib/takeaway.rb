
require "order"
require "message"
require "menu"

class Takeaway

attr_reader :menu, :order, :message

def initialize(menu = Menu.new, order = Order.new, message = Message.new)
  @menu = menu
  @order = order
  @message = message
end

def show_menu
  menu.show_dishes
end

def add(dish)
  fail "That's not on the menu!" unless menu.orderable(dish)
  order.add(dish)
end

end

# 
