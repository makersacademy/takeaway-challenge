class OrderSummary

  def initialize (order_klass = Order.new)
    @order_klass = order_klass
  end

  def final_order
    @order_klass.items #why is the @ symbol needed here to make the test work in rspec?
  end
end
