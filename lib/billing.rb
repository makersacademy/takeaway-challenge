class Billing

  def sum(order)
    total = 0
    order.each do |x|
      if x.key?(:name)
        total = total + x[:price] * x[:quantity]
      end
    end
    total
  end

  def check_sum(order, sum = sum(order))
    total = 0
    order.each do |x|
      if x.key?(:name)
        total = total + x[:price] * x[:quantity]
      end
    end
    total
    raise "Sum is not correct!" unless sum == total
    true
  end

end