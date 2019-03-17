require './lib/takeaway.rb'
require './lib/menu.rb'
require './lib/dish.rb'
require './lib/order.rb'
require './lib/order_calculations.rb'
require './lib/text_message.rb'

def set_up
  takeaway = Takeaway.new
  # Add dishes to menu
  takeaway.menu.add_dish(Dish.new("pizza", 8))
  takeaway.menu.add_dish(Dish.new("pasta", 7.5))
  takeaway.menu.add_dish(Dish.new("coke", 2.5))
  takeaway
end
