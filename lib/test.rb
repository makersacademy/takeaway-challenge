require_relative 'takeaway'

t = Takeaway.new

t.view_menu
t.add("Hummus")
t.add("Hummus")
p t.order.details
t.add("Pita")
t.add("Gyro")
p t.order.details

item_count = Hash.new(0)
t.order.details.each { |item| item_count[item[:name]] += 1 }
item_count.each { |k, v| puts "Item: #{k} | Qty: #{v}"}
puts "Total: $ #{t.order.total}"