require './lib/takeaway'

takeaway = TakeAway.new

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
takeaway.menu

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
takeaway.order(1,"Bratwurst in a bun")
takeaway.order(1,"Käsekrainer in a bun")
takeaway.order(2,"Sauerkraut")
takeaway.order(2,"Sidesalad")
takeaway.order(2,"Weißbier")
