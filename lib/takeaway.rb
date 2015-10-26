require_relative 'menu'
require_relative 'customer_order'
require_relative 'twilio'

class Takeaway

  attr_reader :menu, :cust_order, :sms_handler

  def initialize(menu_klass: Menu.new, sms_klass: TwilioSMS.new)
    @menu = menu_klass
    @sms_handler = sms_klass
  end

  def read_menu
# is this an unnecessary dependency below? why should it know the methods?
    menu.report_menu
    "Order by typing 'Takeaway-name'.order(item, quantity)"
  end

  def order(item, qty, order_klass: CustomerOrder.new)
# is this an unnecessary dependency below? why should it know the methods?
    validate(item)
    @cust_order ||= order_klass
# is this an unnecessary dependency below? why should it know the methods?
    price = menu.report_price(item)
    cust_order.add_items(item, qty, price)
    "Added: #{qty} x #{item}"
  end

  def basket
    cust_order.display_order
  end

  def checkout(amount)
    amount==order_total ? send_sms : (fail "Total incorrect.")
  end

  private

  def order_total
    cust_order.order_total
  end

  def validate(item)
# is this an unnecessary dependency below? why should it know the methods?
    menu.dishes.include?(item) ? item : (fail "I'm sorry, that is not on the menu.") 
  end

  def send_sms
# is this an unnecessary dependency below? why should it know the methods?
    sms_handler.send_sms("Thank you! Your order was placed and will be delivered before #{(Time.now+3600).strftime('%H:%M')}")
  end

end