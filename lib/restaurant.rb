require_relative 'menu'
require_relative 'order'

class Restaurant

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def see_menu
    @menu.print_menu
  end

  def place_order(dish, amount)
    @order.add_dish(dish, amount)
  end

  def close_ticket
    @order.finish_order
  end

  # CALL FOR LOOP IN ORDER CLASS

  # def place_order
  #   @order.add_dish
  #   @order.finish_order
  # end
end
