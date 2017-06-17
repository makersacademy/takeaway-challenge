
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
  check_right(food)
  order.add(food.to_sym, quant)
end

def summary
  order.summary
end

def checkout(payment)
  check_correct(payment)
end

private

def check_correct(payment)
  fail "You're short. Please pay the correct sum man." if payment < order.total
end

def check_right(food)
  fail "That's not on the menu!" unless menu.has?(food)
end

end
