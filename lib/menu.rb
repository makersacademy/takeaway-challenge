require_relative "./dish"
require_relative "./order"

class Menu

  def initialize
    @menulist = []
    @order = Order.new
  end

  def display
    @menulist.dup
  end

  def choose(dish, quantity)
    raise "Dish not in menu" unless @menulist.include?(dish)
    @order.read_dish(dish)
    @order.add_dish_to_order(quantity)     
  end

  def verify_order_total
    @order.verify_total
  end    

  def add_dish_to_menulist(dish)
    @menulist << dish
  end

  def order_checkout
    @order.checkout
  end

end

# def main
#   menu = Menu.new
#   chips = Dish.new("chips",2)
#   menu.add_dish_to_menulist(chips)
#   menu.choose(chips,1)
#   menu.order_checkout
# end

# main