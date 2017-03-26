require_relative 'pricecheck'

menu = Menu.new
order = Order.new
pricecheck = PriceCheck.new


menu.display
order.input
order.total(menu)
pricecheck.sum(order, menu)

fail "incorrect payment amount" if pricecheck.verify(order) == true

puts "You have ordered successfully!"

puts
