require 'menu'
require 'dish'

menu = Menu.new
menu.load_menu
dish = Dish.new(3, menu)

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

menu = Menu.new
menu.load_menu # Menu loads available dishes from CSV file and saves to variable @list
menu.view_price_list # Allows the user to view the menu, which contains dish, description, and price


# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

menu = Menu.new
menu.load_menu
menu.begin_order
# menu.select_dish(3) # Creates an instance of selected dish with quantity and adds to order
menu.current_order.basket

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
