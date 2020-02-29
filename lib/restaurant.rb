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

  # def place_order
  #   @order.add_dish
  #   @order.finish_order
  # end
end
