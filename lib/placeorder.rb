require "./lib/order.rb"
#require "./lib/menu.rb"
require "./twilio_text.rb"

class PlaceOrder

  def initialize(order_klass=Order, confirmation_klass=Confirmation)
    @order_klass = order_klass.new
    @confirmation_klass = confirmation_klass
  end

  def add_to_order(item)
    @order_klass.select(item)
  end

  def checkout
    price_check
    message = "price does not match what you paid for please resart order process"
    fail message if @order_klass.price != price_check
    confirm
  end

  def price_check
    @price_check = 0
    @order_klass.order_price.each {|i| @price_check += i}
    @price_check
  end

  def confirm
    confirmation = @confirmation_klass.new
    confirmation.send_confirmation_text
  end
end