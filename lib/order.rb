require_relative 'menu'
class Order 
  attr_reader :my_choices, :cart
  def initialize 
    @my_choices = {}
    @cart = []
  end 

  def add_dish_to_order(dish, quantity)
    @my_choices = { dish => quantity }
    @add_to_cart
  end

  def add_to_cart
    @cart.push(@my_choices)
  end

end

  order = Order.new
  order.add_dish_to_order('Fried Rice', 3)
  order.add_to_cart
  order.add_dish_to_order('Jollof Rice', 2)
  order.add_to_cart
  order.add_dish_to_order('Beans and stew', 3)
  order.add_to_cart
  puts order.cart

  # def list_dishes
  #   menu = Menu.
  # end
