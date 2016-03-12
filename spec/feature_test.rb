require './lib/takeaway'

takeaway = TakeAway.new

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
# p takeaway.menu

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
p takeaway.order(1,"Bratwurst in a bun")
p takeaway.order(1,"Käsekrainer in a bun")
# p takeaway.order(2,"Sauerkraut")
# p takeaway.order(2,"Sidesalad")
# p takeaway.order(2,"Weißbier")

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
