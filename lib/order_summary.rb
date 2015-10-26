class OrderSummary

  attr_reader :basket #:text_klass

  def initialize #(order_klass = Order.new) #(text_klass = Text.new)
    # @order_klass = order_klass
    @basket = Hash.new(0)
    # @text_klass = text_klass
  end

  def confirm_order(price)
    raise "Sorry our records don't match, we believe the total price is £#{ @basket.total_price }.  Please check your order." unless price_correct?(price)
    # @text_klass.send_text("Thank you! Your order will be delivered before #{Time.now(+3600)}.")
    # @basket = Hash.new(0)
  end

  private

  def price_correct?(price)
    @order_klass.total_price == price
  end


end
