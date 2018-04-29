require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize(menu = Menu.new, order_class = Order)
    @menu = menu
    @order_class = order_class
  end

  def menu
    @menu.display_menu
  end

  def order(order)
    current_menu = menu
    @customer_order = @order_class.new(order, current_menu)
    @customer_order.process ? dispatch(@customer_order) : order_error
  end

  def dispatch(customer_order)
    order_id = customer_order.__id__

  end

  private

  def order_error
    raise 'Order total incorrect.'
  end

end
