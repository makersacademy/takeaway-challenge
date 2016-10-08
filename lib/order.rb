class Order

  attr_reader :order_array, :dish_qty, :total_cost

  def initialize
    @order_array = []
    @dish_qty = 0
    @total_cost = 0
  end

  def add(order_line)
    @order_array << order_line
    @dish_qty += order_line.quantity
    @total_cost += order_line.cost
  end

end
