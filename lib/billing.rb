class Billing

  def sum(order)
    total = 0
    order.each do |x|
      if x.key?(:name)
        total += x[:price] * x[:quantity]
      end
    end
    total
  end

  def check_sum(order, order_total = sum(order))
    total = 0
    order.each do |x|
      if x.key?(:name)
        total += x[:price] * x[:quantity]
      end
    end
    raise "Sum is not correct!" unless order_total == total
    true
  end

end
