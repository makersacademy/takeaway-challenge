class OrderSummary

  def initialize (order_klass = Order.new)
    @order_klass = order_klass
  end

  def final_order
    @order_klass.items #why is the @ symbol needed here to make the test work in rspec?
  end

  def confirm_order(price)
    raise "Sorry our records don't match, we believe the total price is £#{ @order_klass.total_price }.  Please check your order." unless price_correct?(price)
    true
  end

  private

  def price_correct?(price)
    @order_klass.total_price == price
  end
end
