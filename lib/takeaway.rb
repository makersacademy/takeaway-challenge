
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

def add(food, quant=1)
  fail "That's not on the menu!" unless menu.has?(food)
  order.add(food, quant)
end

def summary
  order.summary
end

def checkout(payment)
  check_payment(payment)
end

private

def check_payment(payment)
  fail "You're short. Please pay the correct sum man." if payment < order.total
end

end
