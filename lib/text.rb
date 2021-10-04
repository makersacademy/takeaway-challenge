require_relative "order"

class Text
  def initialize(order = Order.new)
    @order = order
  end

  def confirmation
    "Thank you! Your order was placed and will be delivered before 18:52" if @order.confirm
  end

  def send_text
  end
end
