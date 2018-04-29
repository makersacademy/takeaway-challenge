Siobhans Takeaway App

To access this programme from command line first you need to:
'require ./order.rb'

Bring up the menu by:
menu = Menu.new

Menu Functionality
menu.print = brings up prettified format of menu

To choose your Dishes
dishes = Dishes.new

Dishes Functionality
dishes.add(name, quantity) = use this command to add dishes(format must match menu or items won't be added).

To view and confirm your order
order = Order.new(dishes)

Order Functionality
order.total = total cost of order
order.breakdown = shows items in order, quantity and the item total
order.confirmed? = check status of order
order.confirm = order sent to kitchen, you'll(I'll...) receive confirmation text.
