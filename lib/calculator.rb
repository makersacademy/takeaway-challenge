class Calculator
  def total(order)
    order.inject(:+)
  end
end
