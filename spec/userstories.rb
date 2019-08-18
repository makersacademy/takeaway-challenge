# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

dishes = Dishes.new

dishes.menu

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

order = Order.new

order.select(dish)

order.total

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
