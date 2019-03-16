class Order

  attr_reader :orderlines, :total

  def initialize
    @orderlines = nil
    @total = 0
  end

  def create_order(order_hash, order_calculations = OrderCalculations)
    @orderlines = order_hash
    @total = order_calculations.calculate_total(self)
  end
end
