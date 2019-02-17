require './lib/dish.rb'
require './lib/menu.rb'
require './lib/basket_item.rb'
require './lib/basket.rb'
require './lib/order.rb'
require './lib/message_sender.rb'
require './lib/customer.rb'
pizza = Dish.new("Pizza", 10.00)
pasta = Dish.new("Pasta", 15.00)
rice = Dish.new("Rice", 5.00)
hotpot = Dish.new("Chicken Hot Pot", 23.00)
menu = Menu.new([pizza, pasta, rice, hotpot])
customer = Customer.new("Sally", "Sallys address", "+447540166527")
basket = Basket.new
menu.dishes
selected_dish = menu.select_dish(pizza)
basket.add_item(selected_dish, 2)
basket.add_item(pasta, 1)
basket.add_item(hotpot, 1)
basket.basket_items
basket.basket_total_price
basket.remove_item(selected_dish)
basket.basket_items
basket.basket_total_price
messenger = MessageSender.new
order = Order.new(basket.basket_items, basket.basket_total_price, customer.address, customer.phone_number, messenger)
order.confirm
