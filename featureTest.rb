require './lib/takeaway.rb'
take = TakeAway.new
take.read_menu
take.order_dish('Chicken Poke', 1)
take.order_dish('Chicken Poke', 2)
take.order_dish('Still Water')
puts
take.print_basket
puts
take.check_total
puts
take.deliver_order
