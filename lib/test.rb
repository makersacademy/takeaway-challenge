require_relative 'order'

order = Order.new

order.add("Hummus", 5)
order.add("Pita", 1)

item_count = Hash.new(0)
order.orders.each { |item| item_count[item[:name]] += item[:qty] }


item_count.each { |k, v| puts "Item: #{k} | Qty: #{v}| Tot: $ #{(order.menu.dishes[k] * v)}"}
