require './lib/dish.rb'
require './lib/menu.rb'
require './lib/order.rb'
require './lib/takeaway'
require './lib/messager.rb'

describe Takeaway do
  it ' lets customer order food ' do
    messager = Messager.new
    allow(messager).to receive(:send_message)

    takeaway = Takeaway.new(messager)
    dish1 = Dish.new('pizza', 10)
    dish2 = Dish.new('potato', 3)
    menu = Menu.new
    menu.add_dish(dish1)
    menu.add_dish(dish2)

    menu.show_menu
    order = Order.new(menu)
    takeaway.new_order(order)
    order.add(dish1, 1)
    order.add(dish2, 2)
    order.check_order
    order.place_order
    takeaway.complete_order
  end
end
