require 'menu'
require 'dish'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
menu = Menu.new # Menu loads available dishes from CSV file and saves to variable @list
menu.view_menu # Allows the user to view the menu, which contains dish, description, and price


# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
menu = Menu.new
menu.begin_order
menu.select_dish(3) # Order creates an instance of selected dish with quantity and adds to order


# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
menu = Menu.new
menu.begin_order
menu.select_dish(3)
menu.select_dish(1)
menu.proceed_to_checkout # Shows item list and total


# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
