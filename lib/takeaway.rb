require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :menu, :current_order

  def initialize(order = Order.new)
    @current_order = order
  end

  def see_menu(menu = Menu.new)
    menu.show_menu
  end

  def order(dish, quantity)
    #check if dish is on menu
    current_order.add_dish(dish, quantity)
  end

end



