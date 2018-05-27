require '~/Projects/Makers/week_2_projects/takeaway-challenge/lib/order.rb'
require '~/Projects/Makers/week_2_projects/takeaway-challenge/lib/menu.rb'

order = Order.new
order.select_dish(:roast_goose,3)
order.select_dish(:deep_fried_goose,2)
#order.select_dish(:duck,2)
puts order.basket
