require './lib/takeaway.rb'
require './lib/order.rb'
require './lib/menu.rb'

p t = Takeaway.new("pizza" => 1.99, "pasta" => 2.99, "spam" => 3.99)
p t.order('spame')
p t.order 'spam', 3
p t.order 'pasta'
p t.order_summary
p t.order_total
