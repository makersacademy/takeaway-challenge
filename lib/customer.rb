require_relative 'menu'
require_relative 'order'

class Customer

  def see_menu(filename = 'menu.csv')
    menu = Menu.new(filename)
    menu.print_menu
    @menu_hash = menu.dishes
  end

  def place_order(order_hash)
    raise "Can't load the menu: we can't find the menu you used to place this order." if !@menu_hash
    raise "Can't place order without information about the order: please provide what you would like to order in acceptable format." if !order_hash
    @order = Order.new(order_hash, @menu_hash)
    @order.total
  end

  def see_order
    raise "Order can't be found: looks like it hasn't been placed yet. Please place the order first." if !@order
    @order.print_order
  end

end
