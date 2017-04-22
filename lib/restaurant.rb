require './lib/print'
require './lib/order'

class Restaurant
  MENU = { 'pho' => 5.99, 'curry' => 3.99, 'noodles' => 5.99 }

  def initialize(print_output = Print.new, order = Order.new(MENU))
    @print_output = print_output
    @order = order
  end

  def read_menu
    @print_output.print_menu(MENU)
  end

  def order(dish)
    dish = dish.downcase
    raise @print_output.dish_unavailable(dish) unless dish_available?(dish)
    @order.add(dish)
  end

  private

  def dish_available?(order)
    MENU.include?(order)
  end

end
