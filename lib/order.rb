class Order
  def initialize
    @order = []
    @notified = false
  end

  def add(item)
    @order << item
  end

  def order_complete
    return @order
  end

  def order_total
    order_total = 0
    @order.each do |food|
      order_total += food.values.reduce
    end

    return "Your order was received and its total is #{order_total}!"
  end
end
