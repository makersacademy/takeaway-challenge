require_relative 'menu'
require_relative 'order'

PAYMENT_ERROR = "Not enough money, ya cheapskate!"

class Takeaway

  def initialize(menu=Menu.new, order_class=Order)
    @menu = menu
    @order_class = order_class
  end

  def read_menu
    @menu.read
  end

  def new_order
    @this_order ||= @order_class.new
  end

  def add_to_order(dish)
    @this_order.add(dish)
  end

  def order_price
    @this_order.total_price
  end

  def finalize_order(payment)
    raise PAYMENT_ERROR if payment < @this_order.total_price
    "Thank you! Your order was placed and will be delivered before #{(Time.now + (60*60)).strftime('%H:%M')}"
  end

end
