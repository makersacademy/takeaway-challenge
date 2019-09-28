require './lib/takeaway.rb'
take = TakeAway.new
order = take.order_dish('Chicken Poke')
order = take.order_dish('Coke', 2)
puts take.order
puts
#take.print_out(take.order)
