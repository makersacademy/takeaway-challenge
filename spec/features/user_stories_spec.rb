require './lib/menu.rb'
require './lib/order.rb'
require './lib/confirmation_text.rb'
require './lib/takeaway.rb'

takeaway = Takeaway.new
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
takeaway.view_menu


# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
takeaway.menu_select('pepperoni', 3)
takeaway.menu_select('hawaiian', 1)


# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
takeaway.view_basket
takeaway.view_total_price

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
# takeaway.make_payment(42)
