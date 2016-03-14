require './lib/menu'
require './lib/restaurant'
require './lib/order'
require './lib/dish'

men = Menu.new(dish_klass: Dish)
men.add('Eba and soup', 200)
men.add('Pounded Yam', 150)
men.add('Fried Chicken', 300)
men.add('Borga', 1000)

mama_put = Restaurant.new(menu_instance: men, order_klass: Order)
mama_put.order_add('Borga',30)
mama_put.checkout
