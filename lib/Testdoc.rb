require './lib/Menu'

menu = Menu.new

p menu.prices["chicken"]
p menu.price_finder("chicken") # broken atm
p menu.food[1]
p menu.item_list(0)