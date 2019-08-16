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
