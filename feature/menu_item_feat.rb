require './lib/menu_item.rb'

tuna = MenuItem.new(:tuna, 1)
p tuna
5.times { p tuna.name }
p tuna.price
tuna.add_quantity(3)
p tuna.quantity
