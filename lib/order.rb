class Order
  attr_accessor :dish, :quantity, :order, :line, :order_total

  def initialize(dish = nil,quantity = 0 )
    @dish = dish
    @quantity = quantity
    @order = [{dish => quantity}]
    @order_total = 0
  end

  def add_to_order(dish,quantity)
    @line = {dish => quantity}
    order << line
  end

  def order_total
    # order_total = order.inject {|sum, has| sum + hash[dish]}
  end
end
