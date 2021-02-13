class Calculator
  def initialize(order)
    @calculation = order.view
  end

  def total
    @calculation.reduce(0) { |sum, item| sum + item.price }
  end
end
