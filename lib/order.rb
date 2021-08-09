require_relative 'menu'
class Order 
  attr_reader :my_choices, :cart, :menu
  def initialize 
    @my_choices = {}
    @cart = []
    @menu = Menu.new
  end 

  def add_dish_to_order(dish, quantity)
    @my_choices = { dish => quantity }
    @add_to_cart
  end

  def add_to_cart
    @cart.push(@my_choices)
  end

  def total_cost
    total = 0
    @cart.each { |each_dish|
      each_dish.each { |dish, quantity| 
        total += (quantity * @menu.dishes[dish])
      }
     
    }
    "Your total is £#{total}"
  end
 
end

  # order = Order.new
  # order.add_dish_to_order('Fried Rice', 3)
  # order.add_to_cart
  # order.add_dish_to_order('Jollof Rice', 2)
  # order.add_to_cart
  # order.add_dish_to_order('Beans and stew', 3)
  # order.add_to_cart
  # puts order.cart

  # def list_dishes
  #   menu = Menu.
  # end
