require './lib/print'
require './lib/order'
require './lib/menu'

class Restaurant

  def initialize(menu = Menu.new, print = Print.new, order = Order.new)
    @print = print
    @order = order
    @menu = menu
  end

  def read_menu
    @print.print_menu(@menu)
  end

  def order(dish, quantity = 1)
    dish = dish.downcase
    raise @print.unavailable(dish) unless available?(dish)
    @order.add(dish, quantity)
  end

  def basket
    @order.basket(@menu)
  end

  private

  def available?(order)
    @menu.cuisine.include?(order)
  end

end
