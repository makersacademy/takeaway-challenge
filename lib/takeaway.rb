require_relative 'message'
require_relative 'order'

class Takeaway

  attr_reader :message, :message_class

  PAYMENT_ERROR = "Not enough money, ya cheapskate!"

  def initialize(order_class=Order, message_class=Message)
    @order_class = order_class
    @message_class = message_class
  end

  def read_menu
    @menu.read
  end

  def new_order
    @this_order ||= @order_class.new
  end

  def add_to_order(dish, quantity=1)
    if @this_order.menu.read.include?(dish)
      @this_order.add(dish, quantity)
      "#{quantity}x#{dish} was added to your order"
    end
  end

  def order_price
    "Total: #{@this_order.total_price}"
  end

  def finalize_order(payment)
    fail PAYMENT_ERROR if payment < @this_order.total_price
    create_message
    @message.send_text("Thank you! Your order was placed and will be delivered before #{(Time.now + (60*60)).strftime('%H:%M')}")
    @this_order = nil
  end

    private

    def create_message
      @message = message_class.new
    end


end
