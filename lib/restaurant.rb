require './lib/print'
require './lib/order'

class Restaurant

  def initialize(menu = Menu.new, print_output = Print.new, order = Order.new)
    @print_output = print_output
    @order = order
    @menu = menu
  end

  def read_menu
    @print_output.print_menu(@menu)
  end

  def order(dish, quantity = 1)
    dish = dish.downcase
    raise @print_output.dish_unavailable(dish) unless dish_available?(dish)
    @order.add(dish, quantity)
  end

  private

  def dish_available?(order)
    @menu.cuisine.include?(order)
  end

end
