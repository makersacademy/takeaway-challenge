
require_relative "order"
require_relative "menu"
require_relative "message"

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
  dish = menu.find(dish)
  fail "That's not on the menu!" if dish.nil?
  order.add(dish)
end

def checkout(payment)
  check_payment(payment)
end

private

def check_payment(payment)
  fail "You are short. Please pay the correct sum, man." if payment < order.total
end

end
