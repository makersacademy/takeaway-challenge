require_relative './FinishMyOrder'
require_relative './Menu'
require_relative './Order'
require_relative './Text'

# ---------------------------------- RUN AS DEFAULT ---------------------------------

# burger restaurant is the default so when nothing is passed to Menu.new the menu is a burger menu

burger_restaurant = Menu.new
burger_restaurant.list_available 
# items in stock are shown in the terminal:

# Items in stock:
# 1. burger - £4.50
# 2. hot dog - £3.00
# 3. CocaCola - £1.00
# 4. chips - £2.00

my_order = Order.new(burger_restaurant)
my_order.add('burger', 6)
my_order.add('CocaCola', 2)
my_order.add('chips', 1)
my_order.complete_order

# Calling complete_order on my_order will create a FinishMyOrder instance and pass in my_order in the initialize, then it calls #receipt on that FinishMyOrder instance as well as send_text
# Here is the receipt you would see:
=begin 
What you ordered:
6x burger - £27.00
2x CocaCola - £2.00
1x chips - £2.00
Grand Total: £31.00
=end
# then a text is snet to the default number (mine) with a confirmation, if I ordered at 7:05pm the text will say '"Thank you! Your order was placed and will be delivered before 7:25 PM'

# -------------------------- RUN WITH DIFFERENT MENU --------------------------------

chinese_restaurant = Menu.new(Kernel, [
  { name: 'noodles', price: 7.00, quantity: 10 },
  { name: 'satay chicken', price: 3.50, quantity: 10 },
  { name: 'egg fried rice', price: 6.00, quantity: 5 },
  { name: 'roasted duck', price: 9.00, quantity: 5 }
])
chinese_restaurant.list_available
# shows items in stock

# Items in stock:
# 1. noodles - £7.00
# 2. satay chicken - £3.50
# 3. egg fried rice - £6.00
# 4. roasted duck - £9.00

my_order = Order.new(chinese_restaurant)
my_order.add('noodles', 6)
my_order.add('roasted duck', 3)
my_order.add('satay chicken', 2)
my_order.complete_order
# first the receipt is shown:

# What you ordered:
# 6x noodles - £42.00
# 3x roasted duck - £27.00
# 2x satay chicken - £7.00
# Grand Total: £76.00

# then the confirmation text is sent
