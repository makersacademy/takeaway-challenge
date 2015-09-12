require_relative 'menu'
require_relative 'order'

class Customer
  include Menu

  def check_menu
    menu
  end

  def verify_bill(order, total_price)
    order.order_total(total_price)
  end

end
