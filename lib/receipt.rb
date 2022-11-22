class Receipt
  def initialize(order)
    @order = order
  end

  def print
    if @order.completed?
      order = @order.check_dishes.join(", ")
      total = @order.check_price
      return "#{order}, Total: #{total}"
    else
      return "Order not yet submitted"
    end
  end

end