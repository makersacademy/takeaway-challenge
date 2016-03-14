require './lib/takeaway.rb'
t = TakeAway.new(Order)
t.order("fish and chips", 2)
t.order("chicken korma", 1)
t.current_order.basket_summary
