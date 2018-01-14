require_relative 'order'
require_relative 'menu'

class Takeaway

  attr_reader :menu

  def initialize(order_class = Order, menu_class = Menu)
    @menu = menu_class.new
    @order = order_class.new(@menu)
  end

  def order(item, qty = 1)
    # create_order unless @order
    @order.add(item, qty)
  end

  def order_summary
    @order.to_s
  end

  def check_total
    @order.total
  end

  def submit
    # send confirmation sms
  end

  private

  def send_sms
  end

end