require "./lib/menu.rb"
require "./lib/order.rb"
require "./lib/takeaway.rb"
dishes = { "salad" => 4.00, "falafel" => 3.00, "kombucha" => 2.50}
menu = Menu.new(dishes)
order = Order.new(menu)
takeaway = Takeaway.new(menu, order)
p "Welcome to takeaway! our dishes today:"
takeaway.print_menu
p "you may now add dishes to your order"
p "I'd like a salad.."
order.add("salad", 1)
p "..and 2 falafel.."
order.add("falafel", 2)
p "..and 2 kombuchas!"
order.add("kombucha", 2)
p "Yum! your order is:" 
order.show
p "..and your total is: £" + order.total.to_s
