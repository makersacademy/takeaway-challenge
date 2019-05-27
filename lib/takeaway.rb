# Allows takeaway to checkout current order and send confirmation text message using Twilio API
class Takeaway

  def initialize(order = Order.new)
    @order = order
  end
  
  def checkout
    @order.display_total
  end

end