require_relative 'pricecheck'
require_relative 'sms'

menu = Menu.new
order = Order.new
pricecheck = PriceCheck.new


menu.display
order.input
order.total(menu)
pricecheck.sum(order, menu)

fail "incorrect payment amount" if !pricecheck.verify(order)

puts "Thanks for your order! Your confirmation has been sent."
Sms.text(order.mobile_number)
