require_relative 'customer'
require_relative 'order'
require_relative 'menu'
require_relative 'send_sms'

customer = Customer.new

customer.see_menu
customer.add_items
puts "number of items = " + customer.current_order.items.length.to_s

customer.add_items
puts "number of items = " + customer.current_order.items.length.to_s

puts "order total = " + customer.order_total.to_s

customer.submit_order
puts "order status = " + customer.current_order.status

puts "new order below"

customer.new_order

puts "order status = " + customer.current_order.status
puts "number of items = " + customer.current_order.items.length.to_s

customer.see_menu
customer.add_items
puts "number of items = " + customer.current_order.items.length.to_s
customer.add_items
puts "number of items = " + customer.current_order.items.length.to_s

puts "order total = " + customer.order_total.to_s

customer.submit_order
puts "order status = " + customer.current_order.status