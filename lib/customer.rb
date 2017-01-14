require_relative 'menu'
require_relative 'order'

class Customer

  def see_menu(filename = 'menu.csv')
    menu = Menu.new(filename)
    menu.print_menu
    @menu_hash = menu.dishes
  end

  def place_order(order_hash)
    order = Order.new(order_hash, @menu_hash)
    order.total
  end

end
