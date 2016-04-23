require "./lib/menu.rb"
require "./lib/dish.rb"
require "./lib/order.rb"
p_pizza = Dish.new("Pepperoni Pizza", 9.50)
m_pizza = Dish.new("Margherita Pizza", 7.50)
men = Menu.new(p_pizza, m_pizza)
men.list
ord = Order.new(men)
ord.add "Pepperoni Pizza"
ord.my_order
ord.confirm(9.5)
