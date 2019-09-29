require_relative "../lib/menu.rb"
require_relative "../lib/order.rb"

m = { "pork bao" => 4,
    "chickn bao" => 4,
    "mushroom bao" => 4,
    "tofu bao" => 4,
    "spinach" => 2,
    "kimchi" => 2,
    "dumplings" => 3,
    "beer" => 4,
    "sake" => 5,
    "taiwanese tea" => 3 }

menu = Menu.new(m)

puts menu.view_menu

order = Order.new

order.add("Pork bao", 5)

puts order.order_list
