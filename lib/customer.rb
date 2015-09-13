require_relative 'menu'
require_relative 'order'

class Customer
  include Menu
  include Text

  def check_menu
    display_menu
  end

  def verify_bill(order, total_price)
    order.order_total(total_price)
  end

  def complete_order
    'Thank you for your order!'
    # send_text
  end


end
