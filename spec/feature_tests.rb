# User story 1
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require './lib/menu'
menu = Menu.new
menu.display_menu


# User story 2
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
require './lib/menu'
menu = Menu.new
menu.display_menu
menu.select("chips", 2)
menu.select("kebab", 3)
