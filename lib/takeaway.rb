require_relative 'order'
require_relative 'sms'
class Restaurant

  def initialize(order = Order.new, sms = Message.new)
    @order = order
    @sms = sms
  end

  def menu
    @order.menu
  end

  def make_order(item, how_many)
    @order.buy_item(item, how_many)
  end

  def basket
    @order.basket
  end

  def price
    @order.total
  end

  def checkout
    @sms.send_message
    print "yours basket : "
    print @order.basket
    puts "total price : "
    price
  end
end
