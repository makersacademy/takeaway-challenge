require_relative 'pricecheck'
require_relative 'sms'

#Takeaway collates functionality to receive and confirm order

class Takeaway

attr_reader :menu, :order, :pricecheck

def initialize (menu = Menu.new, order = Order.new, pricecheck = PriceCheck.new)
  @menu = menu
  @order = order
  @pricecheck = pricecheck
end

def place_order
  menu.display
  order.input
  order.total(menu)
  pricecheck.sum(order, menu)
end

def submit_confirmation
  fail "incorrect payment amount" if !pricecheck.verify(order)

  Sms.text(order.mobile_number)
  puts "Thanks for your order! Your confirmation has been sent."
end

end
