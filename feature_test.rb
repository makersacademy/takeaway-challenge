require './lib/takeaway'
require './lib/menu'

menu = Menu.new()
puts menu.inspect

takeaway = Takeaway.new()
puts takeaway.inspect



# [
#   {:item => "Garlic Bread", :price => 5},
#   {:item => "Dips", :price => 3},
#   {:item => "Margherita", :price => 7},
#   {:item => "Frutti di Mare", :price => 11},
#   {:item => "Romana", :price => 10},
#   {:item => "Americana", :price => 11},
#   {:item => "Padana", :price => 9},
#   {:item => "Calzone", :price => 12},
#   {:item => "Diavola", :price => 12}
# ]

# takeaway.view_menu
#
# takeaway.create_order
#
# takeaway.add(dish, amount)
# takeaway.add(dish, amount)
# takeaway.add(dish, amount)
#
# takeaway.check_total
# takeaway.check_out
