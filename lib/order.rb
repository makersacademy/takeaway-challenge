class Order

  attr_reader :orderlines, :total

  def initialize(order_calculations = OrderCalculations)
    @orderlines = nil
    @total = 0
    @order_calculations = order_calculations
  end

  def create_order(order_hash, total)
    @orderlines = order_hash
    @total = total
    @order_calculations.check_total(self)
  end
end
