require_relative 'order'
require_relative 'texter'
class Takeaway

  def initialize menu, order_class = Order, texter_class = Texter
    @menu = menu
    @order_class = order_class
    @texter_class = texter_class
  end

  def twilio_init(twilio_id, auth_token, phone_number)
    @texter = @texter_class.new(twilio_id, auth_token, phone_number)
  end

  def menu
    @menu.to_s
  end

  def order order, price, phone_number
    @order = order_class.new(order, @menu)
    @order.check
    raise "Price Mismatch!" if price != @order.price
    @texter.text phone_number
  end

  private
  attr_reader :order_class
end
