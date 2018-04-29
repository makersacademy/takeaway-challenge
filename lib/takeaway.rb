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

  def order(order)
    current_menu = menu
    @customer_order = @order_class.new(order, current_menu)
    @customer_order.correct? ? call_dispatch(@customer_order) : order_error
  end

  private

  def call_dispatch(customer_order)
    order_id = customer_order.__id__
    @dispatcher.dispatch(order_id)
  end

  def order_error
    raise 'Order total incorrect.'
  end

end
