require_relative 'menu'
require_relative 'order'
require_relative 'dispatcher'

class Takeaway

  def initialize(
      menu = Menu.new,
      order_class = Order,
      dispatcher = Dispatcher.new)
    @menu = menu
    @order_class = order_class
    @dispatcher = dispatcher
  end

  def menu
    @menu.display_menu
  end

  def order(order)@menu
    @order_class.new(order, menu).correct? ? call_dispatch(order) : order_error
  end

  private

  def call_dispatch(customer_order)
    @dispatcher.dispatch(customer_order.__id__)
  end

  def order_error
    raise 'Order total incorrect.'
  end

end
