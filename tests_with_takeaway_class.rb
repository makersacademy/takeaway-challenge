require './lib/dish.rb'
require './lib/menu.rb'
require './lib/basket_item.rb'
require './lib/basket.rb'
require './lib/order.rb'
require './lib/message_sender.rb'
require './lib/customer.rb'
require './lib/takeaway.rb'
pizza = Dish.new("Pizza", 10.00)
pasta = Dish.new("Pasta", 15.00)
rice = Dish.new("Rice", 5.00)
hotpot = Dish.new("Chicken Hot Pot", 23.00)
customer = Customer.new("Sally", "Sallys address", "+447540166527")
takeaway = Takeaway.new(menu_class = Menu, dish_class = Dish, basket = Basket.new,
               message_sender_class = MessageSender, order_class = Order, customer)
menu = takeaway.create_menu([pizza, pasta, rice, hotpot])


menu.dishes
selected_dish = menu.select_dish(pizza)
takeaway.basket.add_item(selected_dish, 2)
takeaway.basket.add_item(pasta, 1)
takeaway.basket.add_item(hotpot, 1)
takeaway.basket.basket_items
takeaway.basket.basket_total_price
takeaway.basket.remove_item(selected_dish)
takeaway.basket.basket_items
takeaway.basket.basket_total_price
takeaway.message_sender
takeaway.create_order
takeaway.confirm_order
