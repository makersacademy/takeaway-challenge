# User story 1
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require './lib/takeaway'
takeaway = TakeAway.new
takeaway.display_menu

# User story 2
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
require './lib/takeaway'
takeaway = TakeAway.new
takeaway.display_menu
takeaway.select("chips", 2)
takeaway.select("kebab", 3)

# User story 3
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
require './lib/takeaway'
takeaway = TakeAway.new
takeaway.display_menu
takeaway.select("chips", 2)
takeaway.select("kebab", 3)
takeaway.summary

# User story 4
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
require './lib/takeaway'
takeaway = TakeAway.new
takeaway.select("kebab", 3)
takeaway.summary
takeaway.complete_order
takeaway.text
