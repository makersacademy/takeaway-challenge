require './lib/interface.rb'
require './lib/menu.rb'


menu = Menu.new
order = Order
TomsTakeaway = Interface.new(menu: menu, order: order)

puts 'Your takeaway can be accessed on the variable - TomsTakeaway'
puts 'Use .show_menu to view menu'
puts 'Use .new_order to start a new order'
puts 'Use .order with the item name to add item to order'
puts 'Use .review_order to view a summary of the order'
puts 'Use .checkout to checkout'
puts '------------------------------------------------------------'
